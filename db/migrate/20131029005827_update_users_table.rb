class UpdateUsersTable < ActiveRecord::Migration
  def up
    add_column("users", "ticket_id", :string, :limit => 255)  
    add_column("users", "sections", :string, :limit => 500) 
  end

  def down
    add_column("users", "ticket_id") 
    add_column("users", "sections") 
  end
end
