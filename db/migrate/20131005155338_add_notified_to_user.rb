class AddNotifiedToUser < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.datetime "notified_email_at"
      t.datetime "notified_phone_at"
    end
  end
end
