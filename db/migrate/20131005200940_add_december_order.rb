class AddDecemberOrder < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.integer "order_number"
    end
  end
end
