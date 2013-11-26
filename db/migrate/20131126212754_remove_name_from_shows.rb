class RemoveNameFromShows < ActiveRecord::Migration
  def change
    remove_column :shows, :name, :string
  end
end
