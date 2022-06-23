class AddActiveIdToBeaches < ActiveRecord::Migration[6.0]
  def change
    add_column :beaches, :activity_id, :integer, array: true, null: false
    add_column :beaches, :facility_id, :integer, array: true, null: false
  end
end
