class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :guesses
  has_many :setlists, through: :guesses
end
