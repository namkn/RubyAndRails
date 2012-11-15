class Movie < ActiveRecord::Base
	attr_accessible :name, :genre, :watched
	validates :name, length: {:minimum => 3}
end
