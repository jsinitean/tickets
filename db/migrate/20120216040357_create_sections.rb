class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string "name"
      t.integer "position"
      t.string "row"
      t.string "section"
      t.string "price"
      t.boolean "visible", :default => false
      t.integer "ticket_id"
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
