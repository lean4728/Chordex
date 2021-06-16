class ChordsController < ApplicationController
  before_action :set_chord, only: %i[ show edit update destroy ]

  YOUTUBE_URL = 'https://www.youtube.com/results?search_query='
  SPOTIFY_URL = 'https://open.spotify.com/search/'

  # GET /chords or /chords.json
  def index
    # @chords = Chord.all
    @q = Chord.ransack(params[:q])
    @chords = @q.result(distinct: true).page(params[:page])
    @youtube_url = YOUTUBE_URL
    @spotify_url = SPOTIFY_URL
  end

  # GET /chords/1 or /chords/1.json
  def show
  end

  # GET /chords/new
  def new
    @chord = Chord.new
  end

  # GET /chords/1/edit
  def edit
  end

  # POST /chords or /chords.json
  def create
    @chord = Chord.new(chord_params)

    respond_to do |format|
      if @chord.save
        format.html { redirect_to @chord, notice: "Chord was successfully created." }
        format.json { render :show, status: :created, location: @chord }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chords/1 or /chords/1.json
  def update
    respond_to do |format|
      if @chord.update(chord_params)
        format.html { redirect_to @chord, notice: "Chord was successfully updated." }
        format.json { render :show, status: :ok, location: @chord }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chords/1 or /chords/1.json
  def destroy
    @chord.destroy
    respond_to do |format|
      format.html { redirect_to chords_url, notice: "Chord was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chord
      @chord = Chord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chord_params
      params.require(:chord).permit(:song, :artist, :chords, :page_url)
    end
end
