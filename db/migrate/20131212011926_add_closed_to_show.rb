class AddClosedToShow < ActiveRecord::Migration
  def change
    add_column :shows, :closed, :boolean, default: false
  end
end
