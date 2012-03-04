class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.integer "team_id"
      t.string "name"
      t.integer "sport_id"
      t.string "location"
      t.boolean "visible", :default => false
      t.timestamps
    end
    add_index("teams", "team_id")
  end

  def self.down
    drop_table :teams
  end
end

