class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.integer :type_id
      t.text :description

      t.timestamps
    end
  end
end
