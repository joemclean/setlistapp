class Show < ActiveRecord::Base
  has_many :setlists
  belongs_to :artist
end
