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
  pending "add some examples to (or delete) #{__FILE__}"
end
