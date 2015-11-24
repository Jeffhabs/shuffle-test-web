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

require 'rails_helper'

RSpec.describe TestQuestion, type: :model do
  it { is_expected.to belong_to(:test) }
  it { is_expected.to belong_to(:question) }
end
