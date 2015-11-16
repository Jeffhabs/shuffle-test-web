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

class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers

  validates_presence_of :question
  validates_presence_of :text
  validates_presence_of :correct
end
