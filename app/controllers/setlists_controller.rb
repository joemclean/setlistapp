class SetlistsController < ApplicationController
  before_action :set_setlist, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_existing_setlist, only: [:new, :create]
  before_filter :check_if_user_is_owner, only: [:edit, :update, :destroy]

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
    @show = Show.find(params[:show_id])
    @setlist = @show.setlists.build
    @songs = @show.artist.songs
    gon.artist_songs = @songs
    gon.setlist_songs = []
  end

  # GET /setlists/1/edit
  def edit
    @show = @setlist.show
    @songs = @show.artist.songs
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
    @show = Show.find(setlist_params[:show_id])
    @setlist = @show.setlists.build(setlist_params)
    @setlist.user_id = current_user.id
    @setlist.songs = get_song_objects_from_json(params[:songs])

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

    @setlist.songs.clear
    @setlist.songs = get_song_objects_from_json(params[:songs])

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

    def get_song_objects_from_json(songs_json)
      song_array = []
      require 'json'
      JSON.parse(songs_json).each do |song|
        song_object = Song.find(song['id'])
        song_array << song_object
      end
      return song_array
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_setlist
      @setlist = Setlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setlist_params
      params.require(:setlist).permit(:user_id, :show_id, :song_ids, :songs)
    end

    def check_for_existing_setlist
      if current_user.setlist_for_show(Show.find(setlist_params[:show_id]))
        redirect_to shows_path, notice: "Sorry, you already have a setlist for that show."
      end
    end

    def check_if_user_is_owner
      unless @setlist.user == current_user
        redirect_to shows_path, notice: "Sorry, that setlist doesn't belong to you."
      end
    end
end
