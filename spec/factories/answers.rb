# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  text        :text
#  correct     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#

FactoryGirl.define do
  factory :answer do
    question
    text     { Faker::Lorem.sentence }
    correct  { rand(2) == 0 }
  end
end
