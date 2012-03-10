class AlterUsersNumber < ActiveRecord::Migration
  def up
    add_column("admin_users", "phone", :string, :limit => 25)
  end

  def down
    remove_column("admin_users", "phone")
  end
end
