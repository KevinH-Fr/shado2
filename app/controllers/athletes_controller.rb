class AthletesController < ApplicationController
  before_action :set_athlete, only: %i[ show edit update destroy ]

  # GET /athletes or /athletes.json
  def index
    @athletes = Athlete.all
  end

  # GET /athletes/1 or /athletes/1.json
  def show
    @image_posts = @athlete.posts_with_images

  end

  
  def display_campaign_type
    @is_principale = params[:principale]
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update('new_campaign',
            partial: "campaigns/form",
            locals: { campaign: Campaign.new, principale: @is_principale })
        ]        
      end
    end
  end
  

  def display_media_type
    @media = params[:media]

    @athlete = Athlete.find(params[:athlete])
    @image_posts = @athlete.posts_with_images
    @video_posts = @athlete.posts_with_videos

    respond_to do |format|
      format.turbo_stream do
        if @media == "images"
          partial = 'media_images'
        elsif @media == "videos"
          partial = 'media_videos'
        end 
        render turbo_stream: turbo_stream.update(
          'partial-container', partial: 'athletes/' + partial
        )
      end
    end
  end

  # GET /athletes/new
  def new
    @athlete = Athlete.new
    @sports = Sport.all
  end

  # GET /athletes/1/edit
  def edit
    @sports = Sport.all

  end

  # POST /athletes or /athletes.json
  def create
    @athlete = Athlete.new(athlete_params)

    respond_to do |format|
      if @athlete.save
        format.html { redirect_to steps_user_athlete_campaign_path, notice: "Athlete was successfully created." }
        format.json { render :show, status: :created, location: @athlete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /athletes/1 or /athletes/1.json
  def update
    respond_to do |format|
      if @athlete.update(athlete_params)
        format.html { redirect_to athlete_url(@athlete), notice: "Athlete was successfully updated." }
        format.json { render :show, status: :ok, location: @athlete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /athletes/1 or /athletes/1.json
  def destroy
    @athlete.destroy!

    respond_to do |format|
      format.html { redirect_to athletes_url, notice: "Athlete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_athlete
      @athlete = Athlete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def athlete_params
      params.require(:athlete).permit(:user_id, :profile_pic, :panorama_pic, :sport_id, :name, :bio)
    end
end
