class ScreenTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_screen_type, only: [:show, :edit, :update, :destroy]

  # GET /screen_types
  # GET /screen_types.json
  def index
    @screen_types = ScreenType.all
  end

  # GET /screen_types/1
  # GET /screen_types/1.json
  def show
  end

  # GET /screen_types/new
  def new
    @screen_type = ScreenType.new
  end

  # GET /screen_types/1/edit
  def edit
  end

  # POST /screen_types
  # POST /screen_types.json
  def create
    @screen_type = ScreenType.new(screen_type_params)

    respond_to do |format|
      if @screen_type.save
        format.html { redirect_to @screen_type, notice: 'Screen type was successfully created.' }
        format.json { render :show, status: :created, location: @screen_type }
      else
        format.html { render :new }
        format.json { render json: @screen_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screen_types/1
  # PATCH/PUT /screen_types/1.json
  def update
    respond_to do |format|
      if @screen_type.update(screen_type_params)
        format.html { redirect_to @screen_type, notice: 'Screen type was successfully updated.' }
        format.json { render :show, status: :ok, location: @screen_type }
      else
        format.html { render :edit }
        format.json { render json: @screen_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screen_types/1
  # DELETE /screen_types/1.json
  def destroy
    @screen_type.destroy
    respond_to do |format|
      format.html { redirect_to screen_types_url, notice: 'Screen type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screen_type
      @screen_type = ScreenType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def screen_type_params
      params.require(:screen_type).permit(:name, :width, :height)
    end
end
