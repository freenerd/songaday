class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :embed
      t.string :artist
      t.string :title
      t.text :story

      t.timestamps
    end
  end
end
