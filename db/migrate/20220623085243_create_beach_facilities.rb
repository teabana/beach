class CreateBeachFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :beach_facilities do |t|
      t.references  :beach,          null: false,  foreign_key: true
      t.references  :user,           null: false,  foreign_key: true
      t.integer     :facility_id,    null: false
      t.timestamps
    end
  end
end
