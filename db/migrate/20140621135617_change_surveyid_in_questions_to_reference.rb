class ChangeSurveyidInQuestionsToReference < ActiveRecord::Migration
  def change
     change_column :questions, :survey_id, :integer, references: :surveys
  end
end
