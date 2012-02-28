class AddOpposingTeam < ActiveRecord::Migration
    def self.up
      create_table :opposing_teams do |t|
        t.integer "team_id"
        t.string "name"
        t.string "location"
        t.integer "sport_id"
        t.boolean "visible", :default => false
        t.timestamps
      end
      add_index("opposing_teams", "team_id")
    end

    def self.down
      drop_table :opposing_teams
    end
  end
