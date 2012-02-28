class AlterTeamsSport < ActiveRecord::Migration
  def up
    add_column("teams", "sport_id", :integer)
  end

  def down
    remove_column("teams", "sport_id")
  end
end
