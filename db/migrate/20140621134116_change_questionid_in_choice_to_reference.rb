class ChangeQuestionidInChoiceToReference < ActiveRecord::Migration
  def change
     remove_column :choices, :question_id
     add_column :choices, :question_id, :integer, references: :questions
  end
end
