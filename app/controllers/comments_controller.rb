class CommentsController < ApplicationController
	def create
		@song = Song.find params[:song_id]
		@comments = @song.comments
		@comment = @song.comments.build(params[:comment])
		@comment.user_id = 1
		if @comment.save
			respond_to do |format|
				format.html {redirect_to song_path(@song), :notice => "Comment created"}
				format.js
			end
		else
			
		end
	end

	def edit
		@song = Song.find params[:song_id]
		@comment = Comment.find params[:id]
	end

	def update
		@song = Song.find params[:song_id]
		@comment = @song.comments.find params[:id]
		@comments = @song.comments
		if @comment.update_attributes(params[:comment]) 
			respond_to do |format|
				format.html {redirect_to song_path(@song), :notice => "Comment Updated"}
				format.js
			end
		else
			render :partial => 'comments/form', :locals => {:song => @song, :comment => @comment}
		end
	end

	def destroy
		@song = Song.find params[:song_id]
		@comment = @song.comments.find params[:id]
		if @comment.destroy
			respond_to do |format|
				format.html {redirect_to song_path(@song), :notice => "Comment Deleted"}
				format.js
			end
			
		end
	end
end
