class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end
  #have an empty method even if it has no logic
  def new
    @song = Song.new
  end

  def create
      @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
      # show same page for user to retry
    end
  end

  def edit
  end

  def update
    #why is the argument song_params
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private
  # strong params
  def song_params
    params.require(:song).permit( :title, :artist)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
