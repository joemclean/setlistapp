class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :date
      t.string :venue
      t.string :time

      t.timestamps
    end
  end
end
