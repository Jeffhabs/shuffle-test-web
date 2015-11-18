# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  category_id       :integer
#  question_type     :string(255)
#  text              :text
#  provided          :text
#  provided_language :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_questions_on_category_id  (category_id)
#

FactoryGirl.define do
  factory :question do
    category
    question_type { %w(short_answer long_answer multiple_choice).sample }
    text { Faker::Lorem.sentence }
    provided { Faker::Lorem.sentence }
    provided_language { ['Python', 'Ruby', 'C++'].sample }
  end
end
