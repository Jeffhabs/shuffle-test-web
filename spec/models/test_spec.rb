# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Test, type: :model do
  it { is_expected.to have_many(:test_questions).dependent(:destroy) }
  it { is_expected.to have_many(:questions).through(:test_questions) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :category_ids }
  it { is_expected.to validate_presence_of :short_questions_count }
  it { is_expected.to validate_presence_of :long_questions_count }

  let(:category_1)       { create :category }
  let(:category_2)       { create :category }
  let!(:short_questions) { create_list :question, 3, question_type: 'short_answer', category: category_1 }
  let!(:long_questions)  { create_list :question, 3, question_type: 'long_answer', category: category_1 }
  let!(:other_questions) { create_list :question, 3, category: category_2 }
  let(:test)             { build :test, category_ids: [category_1.id] }

  it 'generates test on create' do
    expect { test.save! }.to change { test.questions.count }.from(0).to(2)
  end

  it "doesn't generate it multiple times" do
    test.save!
    expect { test.save! }.not_to change { test.questions.count }
  end
end
