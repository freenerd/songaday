class AddPhoneEmailToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string "other_email"
      t.string "other_phone"
      t.string "phone"
    end
  end
end
