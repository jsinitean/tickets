class AddPriceSections < ActiveRecord::Migration
  def up
    add_column("no_of_tickets", "username", :string, :limit => 25)
  end

  def down
    remove_column("no_of_tickets", "username")
  end
end
