class AddSoundCloudUrlToSong < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.string "soundcloud_url"
    end
  end
end
