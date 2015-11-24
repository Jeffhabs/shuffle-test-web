# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :test do
    name { Faker::Lorem.word }
    category_ids { create_list(:category, 3).map(&:id) }
    short_questions_count 1
    long_questions_count 1

    after(:create) do |test|
      test.test_questions = create_list(:test_question, 3, test: test)
      test.save!
    end
  end
end
