class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :email
      t.string :channel

      t.timestamps
    end
  end
end
