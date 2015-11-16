class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.string :question_type
      t.text :text
      t.text :provided
      t.string :provided_language

      t.timestamps null: false
    end
  end
end
