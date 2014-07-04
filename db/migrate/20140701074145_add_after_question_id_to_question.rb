class AddAfterQuestionIdToQuestion < ActiveRecord::Migration
  def change
     add_column :questions, :after_question_id, :integer
  end
end
