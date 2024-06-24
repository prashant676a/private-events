class AddCreatorIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :creator_id, :bigint
    add_index :events, :creator_id
  end
end
