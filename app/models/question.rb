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

class Question < ActiveRecord::Base
  belongs_to :category

  has_many :test_questions
  has_many :tests, inverse_of: :questions

  has_many :answers, inverse_of: :question, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :question_type
  validates_inclusion_of :question_type, in: %(short_answer long_answer multiple_choice')

  validates_presence_of :provided_language
  validates_inclusion_of :provided_language, in: %(Python Ruby C++')

  validates_presence_of :text
  validates_presence_of :provided

  scope :short, -> { where question_type: :short_answer }
  scope :long,  -> { where question_type: :long_answer }
end
