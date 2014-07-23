class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :choice, index: true
      t.string :content

      t.timestamps
    end
  end
end
