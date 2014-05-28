class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :theme_id
      t.text :description

      t.timestamps
    end
  end
end
