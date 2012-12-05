class AlterUsersGameDate < ActiveRecord::Migration
  def up
    add_column("users", "game", :string, :limit => 250)
    add_column("users", "date", :string, :limit => 250)
  end

  def down
    remove_column("users", "game", :string, :limit => 250)
    remove_column("users", "date", :string, :limit => 250)
  end
end
