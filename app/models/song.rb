class Song < ActiveRecord::Base
	attr_accessible :name, :artist, :genre
	validates :name, length: {:minimum => 3}

	has_many :comments, :dependent => :destroy
end
