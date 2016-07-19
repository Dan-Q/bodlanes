class ContentAreasController < ApplicationController
  before_action :set_content_area, only: [:show, :edit, :update, :destroy]

  # GET /content_areas
  # GET /content_areas.json
  def index
    @content_areas = ContentArea.all
  end

  # GET /content_areas/1
  # GET /content_areas/1.json
  def show
  end

  # GET /content_areas/new
  def new
    @content_area = ContentArea.new
  end

  # GET /content_areas/1/edit
  def edit
  end

  # POST /content_areas
  # POST /content_areas.json
  def create
    @content_area = ContentArea.new(content_area_params)

    respond_to do |format|
      if @content_area.save
        format.html { redirect_to @content_area, notice: 'Content area was successfully created.' }
        format.json { render :show, status: :created, location: @content_area }
      else
        format.html { render :new }
        format.json { render json: @content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_areas/1
  # PATCH/PUT /content_areas/1.json
  def update
    respond_to do |format|
      if @content_area.update(content_area_params)
        format.html { redirect_to @content_area, notice: 'Content area was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_area }
      else
        format.html { render :edit }
        format.json { render json: @content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_areas/1
  # DELETE /content_areas/1.json
  def destroy
    @content_area.destroy
    respond_to do |format|
      format.html { redirect_to content_areas_url, notice: 'Content area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_area
      @content_area = ContentArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_area_params
      params.require(:content_area).permit(:template, :name, :width, :height, :content_type)
    end
end
