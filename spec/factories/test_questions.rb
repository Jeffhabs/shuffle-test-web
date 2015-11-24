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

FactoryGirl.define do
  factory :test_question do
    test
    question
  end
end
