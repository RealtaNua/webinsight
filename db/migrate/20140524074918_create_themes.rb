class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :description
      t.string :csscontent

      t.timestamps
    end
  end
end
