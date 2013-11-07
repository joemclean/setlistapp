class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :song_id
      t.integer :setlist_id

      t.timestamps
    end
  end
end
