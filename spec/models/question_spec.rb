# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  category_id       :integer
#  question_type     :string
#  text              :text
#  provided          :text
#  provided_language :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_questions_on_category_id  (category_id)
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to :category }
  it { is_expected.to have_many :answers }

  it { is_expected.to validate_presence_of :question_type }
  it { is_expected.to validate_inclusion_of(:question_type).in_array ['short_answer', 'long_answer', 'multiple_choice'] }

  it { is_expected.to validate_presence_of :provided_language }
  it { is_expected.to validate_inclusion_of(:provided_language).in_array ['Python', 'Ruby', 'C++'] }
end
