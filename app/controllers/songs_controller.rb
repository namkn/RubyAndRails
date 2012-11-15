class SongsController < ApplicationController
  before_filter :authorize, only: [:new, :create]
  def index
  	@songs = Song.all
  end
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      redirect_to @song, :notice => "Successfully created song."
    else
      render :action => 'new'
    end
  end

  def show
  	@song = Song.find(params[:id]);
    @comments = @song.comments
    @comment = Comment.new

  end

  def edit
    @song = Song.find(params[:id]);

  end

  def update
    @song = Song.find(params[:id]);
    if @song.update_attributes(params[:song])
      redirect_to @song, :notice => "Successfully updated song."
    else
      render :action => 'edit'
    end
  end

  def destroy
     @song = Song.find(params[:id]);
     if(@song.destroy) 
      redirect_to songs_path, :notice => "Successfully deleted song."
    end
  end
end
