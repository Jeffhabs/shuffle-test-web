# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Test < ActiveRecord::Base
  has_many :test_questions, dependent: :destroy, inverse_of: :test

  has_many :questions, through: :test_questions, inverse_of: :tests

  validates_presence_of :name

  attr_accessor :category_ids
  attr_accessor :short_questions_count
  attr_accessor :long_questions_count
  validates_presence_of :category_ids, on: :create
  validates_presence_of :short_questions_count, greater_than: 0, on: :create
  validates_presence_of :long_questions_count, greater_than: 0, on: :create

  before_create do
    if questions.empty?
      questions << Question.short.where(category_id: category_ids).order('RANDOM()').limit(short_questions_count)
      questions << Question.long.where(category_id: category_ids).order('RANDOM()').limit(long_questions_count)
    end
  end
end
