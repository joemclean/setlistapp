class ChangeDateFromStringToDate < ActiveRecord::Migration
  def self.up
    remove_column :shows, :date
    add_column :shows, :date, :date
  end

  def self.down
   remove_column :shows, :date
   add_column :shows, :date, :string
  end
end
