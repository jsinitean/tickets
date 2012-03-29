class AlterSections < ActiveRecord::Migration
  def up
    rename_column("sections", "ticket_id", "tickets_id")
  end

  def down
    rename_column("sections", "tickets_id", "ticket_id")
  end
end
