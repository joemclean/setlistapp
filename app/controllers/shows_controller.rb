class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy, :close, :open]
  before_filter :is_user_admin?, except: [:index, :show]

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.find(:all, order: "date")
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
  end

  # GET /shows/new
  def new
    @show = Show.new
    @artists = Artist.all
  end

  # GET /shows/1/edit
  def edit
    @artists = Artist.all
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)

    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show }
      else
        format.html { render action: 'new' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url }
      format.json { head :no_content }
    end
  end

  def close
    @show.closed = true
    if @show.save
      redirect_to shows_path, notice: 'Show was successfully closed.'
    else
      redirect_to shows_path, notice: 'Something went wrong.'
    end
  end

  def open
    @show.closed = false
    if @show.save
      redirect_to shows_path, notice: 'Show was successfully reopened.'
    else
      redirect_to shows_path, notice: 'Something went wrong.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:show).permit(:artist_id, :name, :date, :venue, :time)
    end

    def is_user_admin?
      redirect_to(root_url, notice: "Hey! You can't do that if you're not an admin.") unless current_user.admin?
    end
end
