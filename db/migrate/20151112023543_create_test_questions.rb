class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
      t.belongs_to :test
      t.belongs_to :question
      t.integer :position

      t.timestamps null: false
    end
  end
end
