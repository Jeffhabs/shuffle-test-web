# == Schema Information
#
# Table name: test_questions
#
#  id          :integer          not null, primary key
#  test_id     :integer
#  question_id :integer
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TestQuestion < ActiveRecord::Base
  belongs_to :test, inverse_of: :questions
  belongs_to :question

  scope :short, -> { where question: { question_type: 'short_answer' } }
  scope :long,  -> { where question: { question_type: 'long_answer' } }
end
