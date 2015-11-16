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

require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { is_expected.to belong_to :question }

  it { is_expected.to validate_presence_of :question }
  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :correct }
end
