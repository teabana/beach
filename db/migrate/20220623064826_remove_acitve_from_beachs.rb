class RemoveAcitveFromBeachs < ActiveRecord::Migration[6.0]
  def change
    remove_column :beaches, :activity_id, :integer
    remove_column :beaches, :facility_id, :integer
  end
end
