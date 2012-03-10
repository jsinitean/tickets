class AlterOpposingTeams < ActiveRecord::Migration
  def up
    add_column("opposing_teams", "abbreviation", :string, :limit => 3)
  end

  def down
    remove_column("opposing_teams", "abbreviation")
  end
end
