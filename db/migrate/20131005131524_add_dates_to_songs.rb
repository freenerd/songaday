class AddDatesToSongs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.datetime "publish_at"
      t.datetime "listened_to_first_at"
      t.datetime "listened_to_last_at"
    end
  end
end
