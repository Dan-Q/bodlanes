class MediaFilesController < ApplicationController
  before_action :set_presentation
  before_action :set_media_file, only: [:show, :edit, :update, :destroy]

  # GET /media_files
  # GET /media_files.json
  def index
    @media_files = @presentation.media_files.all
  end

  # GET /media_files/1
  # GET /media_files/1.json
  def show
  end

  # GET /media_files/new
  def new
    @media_file = @presentation.media_files.new
  end

  # GET /media_files/1/edit
  def edit
  end

  # POST /media_files
  # POST /media_files.json
  def create
    @media_file = @presentation.media_files.new(media_file_params)

    respond_to do |format|
      if @media_file.save
        format.html { redirect_to edit_presentation_path(@presentation), notice: 'Media file was successfully created.' }
        format.json { render :show, status: :created, location: [@presentation, @media_file] }
      else
        format.html { render :new }
        format.json { render json: @media_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_files/1
  # PATCH/PUT /media_files/1.json
  def update
    respond_to do |format|
      if @media_file.update(media_file_params)
        format.html { redirect_to edit_presentation_path(@presentation), notice: 'Media file was successfully updated.' }
        format.json { render :show, status: :ok, location: [@presentation, @media_file] }
      else
        format.html { render :edit }
        format.json { render json: @media_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_files/1
  # DELETE /media_files/1.json
  def destroy
    @media_file.destroy
    respond_to do |format|
      format.html { redirect_to edit_presentation_path(@presentation), notice: 'Media file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end
    def set_media_file
      @media_file = @presentation.media_files.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_file_params
      params.require(:media_file).permit(:file)
    end
end
