class AlterSectionsColumns < ActiveRecord::Migration
  def up
    add_column("sections", "value", :string, :limit => 25)
    add_column("sections", "sold", :boolean, :default => false)
  end

  def down
    remove_column("sections", "value")
    remove_column("sections", "sold")
  end
end
