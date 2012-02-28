class AlterTeams < ActiveRecord::Migration
  def up
    add_column("teams", "location", :string, :limit => 25)
  end

  def down
    remove_column("teams", "location")
  end
end
