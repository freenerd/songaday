class AddHashToSong < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.string "url_hash"
    end
  end
end
