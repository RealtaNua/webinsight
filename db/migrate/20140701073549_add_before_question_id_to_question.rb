class AddBeforeQuestionIdToQuestion < ActiveRecord::Migration
  def change
    if !column_exists?(:questions, :before_question_id)
     add_column :questions, :before_question_id, :integer
    end
  end
end
