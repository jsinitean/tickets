class AddNotePromoTickets < ActiveRecord::Migration
  def up
    add_column("tickets", "promo", :string, :limit => 255)  
    add_column("tickets", "notes", :string, :limit => 255) 
  end

  def down
    add_column("tickets", "promo") 
    add_column("tickets", "notes") 
  end
end
