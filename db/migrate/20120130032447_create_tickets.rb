class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string "name"
      t.integer "position"
      t.boolean "visible", :default => false
      t.datetime "game_at"
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
