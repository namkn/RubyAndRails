class Comment < ActiveRecord::Base
	attr_accessible :user_id, :date, :content, :song_id
	validates :user_id, :presence => true
	validates :content, length: {:minimum => 3}

	belongs_to :song
end
