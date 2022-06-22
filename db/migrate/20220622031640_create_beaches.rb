class CreateBeaches < ActiveRecord::Migration[6.0]
  def change
    create_table :beaches do |t|
      t.string      :beach,         null: false
      t.text        :detail,        null: false
      t.integer     :area_id,       null: false
      t.integer     :activity_id,   null: false
      t.integer     :facility_id,   null: false
      t.references  :user,          null: false,  foreign_key: true
      t.timestamps
    end
  end
end