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
  has_many :test_questions, dependent: :destroy

  has_many :questions, through: :test_questions, inverse_of: :tests

  validates_presence_of :name

  attr_accessor :short_questions_count
  attr_accessor :long_questions_count
  validates_presence_of :short_questions_count, greater_than: 0, on: :create
  validates_presence_of :long_questions_count, greater_than: 0, on: :create

  before_create do
    if questions.empty?
      questions << Question.short.order('RANDOM()').limit(short_questions_count)
      questions << Question.long.order('RANDOM()').limit(long_questions_count)
    else
      if questions.short.count < short_questions_count
        questions << Question.where.not(id: questions.long.map(&:id)).order('RANDOM()')
      end

      if questions.long.count < long_questions_count
      end
    end
  end
end
