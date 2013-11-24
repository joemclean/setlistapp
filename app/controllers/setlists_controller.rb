class SetlistsController < ApplicationController
  before_action :set_setlist, only: [:show, :edit, :update, :destroy]

  # GET /setlists
  # GET /setlists.json
  def index
    @setlists = Setlist.all
  end

  # GET /setlists/1
  # GET /setlists/1.json
  def show
  end

  # GET /setlists/new
  def new
    @setlist = Setlist.new
    @songs = Song.all
    gon.artist_songs = @songs
    gon.setlist_songs = []
  end

  # GET /setlists/1/edit
  def edit
    @songs = Song.all
    @artist_songs = []
    @songs.each do |song|
      unless @setlist.songs.include?(song)
        @artist_songs << song
      end
    end

    gon.artist_songs = @artist_songs
    gon.setlist_songs = @setlist.songs
  end

  # POST /setlists
  # POST /setlists.json
  def create
    @setlist = Setlist.new(setlist_params)
    
    song_array = []

    require 'json'
    JSON.parse(params[:songs]).each do |song|
      song_object = Song.find(song['id'])
      song_array << song_object
    end

    @setlist.songs = song_array

    respond_to do |format|
      if @setlist.save
        format.html { redirect_to @setlist, notice: 'Setlist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @setlist }
      else
        format.html { render action: 'new' }
        format.json { render json: @setlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setlists/1
  # PATCH/PUT /setlists/1.json
  def update

    song_array = []

    require 'json'
    JSON.parse(params[:songs]).each do |song|
      song_object = Song.find(song['id'])
      song_array << song_object
    end
    @setlist.songs.clear
    @setlist.songs = song_array

    respond_to do |format|
      if @setlist.save
        format.html { redirect_to @setlist, notice: 'Setlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @setlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setlists/1
  # DELETE /setlists/1.json
  def destroy
    @setlist.destroy
    respond_to do |format|
      format.html { redirect_to setlists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setlist
      @setlist = Setlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setlist_params
      params.require(:setlist).permit(:user_id, :show_id, :song_ids, :songs)
    end

end
