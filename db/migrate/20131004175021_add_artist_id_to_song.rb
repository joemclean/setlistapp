class AddArtistIdToSong < ActiveRecord::Migration
  def change
    add_column :songs, :artist_id, :int
  end
end
