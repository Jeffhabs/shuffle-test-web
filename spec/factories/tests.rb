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
    name "MyString"
category ""
show_questions_count 1
long_questions_count 1
  end

end
