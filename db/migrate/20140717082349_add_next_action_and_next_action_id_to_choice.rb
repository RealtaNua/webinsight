class AddNextActionAndNextActionIdToChoice < ActiveRecord::Migration
  def change
    add_column :choices, :next_action, :string
    add_column :choices, :next_action_id, :integer
  end
end
