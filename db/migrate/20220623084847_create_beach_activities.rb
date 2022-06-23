class CreateBeachActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :beach_activities do |t|
      t.references  :beach,          null: false,  foreign_key: true
      t.references  :user,           null: false,  foreign_key: true
      t.integer     :activity_id,    null: false
      t.timestamps
    end
  end
end
