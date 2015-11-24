# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Test class
# The model representing a generated test.
class Test < ActiveRecord::Base
  # A test has many test questions.
  # When a test question is destroyed it should destroy the test_question associated to it.
  has_many :test_questions, dependent: :destroy, inverse_of: :test

  # A test has many questions through test_questions.
  has_many :questions, through: :test_questions, inverse_of: :tests

  # Validate the presence of name in the database.
  validates_presence_of :name

  # Create a ephemeral attribute 'category_ids'.
  # These are a list of ids cooresponding to categories to pick questions from.
  attr_accessor :category_ids

  # Validate the presence of the category_ids on resource creation.
  validates_presence_of :category_ids, on: :create

  # Create a ephemeral attribute 'short_questions_count'.
  # It represents the amount of questions of question type "short_answer".
  attr_accessor :short_questions_count

  # Validate the presence of the short_questions_count on resource creation.
  validates_presence_of :short_questions_count, greater_than: 0, on: :create

  # Create a ephemeral attribute 'long_questions_count'.
  # It represents the amount of questions of question type "long_answer".
  attr_accessor :long_questions_count

  # Validate the presence of the long_questions_count on resource creation.
  validates_presence_of :long_questions_count, greater_than: 0, on: :create

  # Before creation callback.
  # Before create, association random questions to the test.
  before_create do
    # Break out of callback if there are questions present.
    break unless questions.empty?

    # Filter questions where question_type is equal short_answer.
    # Filter category_id where an category_id is in category_ids ephemeral attribute.
    # Order randomly.
    # Limit results by the ephemeral attribute short_questions_count.
    questions << Question.short.where(category_id: category_ids).order('RANDOM()').limit(short_questions_count)

    # Filter questions where question_type is equal long_answer.
    # Filter category_id where an category_id is in category_ids ephemeral attribute.
    # Order randomly.
    # Limit results by the ephemeral attribute long_questions_count.
    questions << Question.long.where(category_id: category_ids).order('RANDOM()').limit(long_questions_count)
  end
end
