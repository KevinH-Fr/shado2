class FansController < ApplicationController
  before_action :set_fan, only: %i[ show edit update destroy ]

  # GET /fans or /fans.json
  def index
    @fans = Fan.all
  end

  # GET /fans/1 or /fans/1.json
  def show
  end

  # GET /fans/new
  def new
    @fan = Fan.new
  end

  # GET /fans/1/edit
  def edit
  end

  # POST /fans or /fans.json
  def create
    @fan = Fan.new(fan_params)

    respond_to do |format|
      if @fan.save
        format.html { redirect_to fan_url(@fan), notice: "Fan was successfully created." }
        format.json { render :show, status: :created, location: @fan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fans/1 or /fans/1.json
  def update
    respond_to do |format|
      if @fan.update(fan_params)
        format.html { redirect_to fan_url(@fan), notice: "Fan was successfully updated." }
        format.json { render :show, status: :ok, location: @fan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fans/1 or /fans/1.json
  def destroy
    @fan.destroy!

    respond_to do |format|
      format.html { redirect_to fans_url, notice: "Fan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fan
      @fan = Fan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fan_params
      params.require(:fan).permit(:user_id, :profile_pic, :pseudo, :bio)
    end
end
