class ChangeDateFromStringToDate < ActiveRecord::Migration
  def self.up
   change_column :shows, :date, :date
  end

  def self.down
   change_column :shows, :date, :string
  end
end
