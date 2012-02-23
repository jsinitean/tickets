class AddPriceSections < ActiveRecord::Migration
  def up
    add_column("sections", "no_of_tickets", :string, :limit => 25)
  end

  def down
    remove_column("sections", "no_of_tickets")
  end
end
