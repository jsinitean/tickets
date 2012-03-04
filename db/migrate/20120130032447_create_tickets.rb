class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string "name"
      t.boolean "visible", :default => false
      t.datetime "game_at"
      t.integer "team_id"
      t.integer "opposing_teams_id"
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
