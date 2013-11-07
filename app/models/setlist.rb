class Setlist < ActiveRecord::Base
  has_many :guesses
  has_many :songs, through: :guesses
  belongs_to :show
end
