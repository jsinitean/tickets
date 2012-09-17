class AlterOpposingTeams < ActiveRecord::Migration
  def up
    create_table "opposing_teams", :force => true do |t|
      t.string   "name"
      t.string   "city"
      t.string   "location"
      t.integer  "sport_id"
      t.boolean  "visible",                   :default => false
      t.datetime "created_at",                                   :null => false
      t.datetime "updated_at",                                   :null => false
      t.string   "abbreviation", :limit => 3
  end
end

  def down
    drop_table "opposing_teams"
  end
end
