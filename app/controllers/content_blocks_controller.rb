class ContentBlocksController < ApplicationController
  before_action :set_presentation
  before_action :set_content_block, only: [:show, :edit, :update, :destroy]
  before_action :load_linkable_content, only: [:new, :edit, :create, :update]

  # GET /content_blocks
  # GET /content_blocks.json
  def index
    redirect_to edit_presentation_path(@presentation)
  end

  # GET /content_blocks/1
  # GET /content_blocks/1.json
  def show
  end

  # GET /content_blocks/new
  def new
    @content_block = @presentation.content_blocks.new(content_block_params)
  end

  # GET /content_blocks/1/edit
  def edit
  end

  # POST /content_blocks
  # POST /content_blocks.json
  def create
    @content_block = @presentation.content_blocks.new(content_block_params)

    respond_to do |format|
      if @content_block.save
        format.html { redirect_to edit_presentation_path(@presentation), notice: 'Content block was successfully created.' }
        format.json { render :show, status: :created, location: [@presentation, @content_block] }
      else
        format.html { render :new }
        format.json { render json: @content_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_blocks/1
  # PATCH/PUT /content_blocks/1.json
  def update
    respond_to do |format|
      if @content_block.update(content_block_params)
        format.html { redirect_to edit_presentation_path(@presentation), notice: 'Content block was successfully updated.' }
        format.json { render :show, status: :ok, location: [@presentation, @content_block] }
      else
        format.html { render :edit }
        format.json { render json: @content_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_blocks/1
  # DELETE /content_blocks/1.json
  def destroy
    @content_block.destroy
    respond_to do |format|
      format.html { redirect_to edit_presentation_path(@presentation), notice: 'Content block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end
    def set_content_block
      @content_block = @presentation.content_blocks.find(params[:id])
    end

    # Loads a list of other content blocks and areas that can be used in hyperlinks
    def load_linkable_content
      @linkable_content_areas = @presentation.template.content_areas
      @linkable_content_blocks = @presentation.content_blocks.where('id <> ?', params[:id] || -1)
      @linkable_images = @presentation.media_files.image
      @plugins_yaml = @presentation.plugins.map{|p|YAML.load(File.open("#{Rails.root}/lib/bodlanes-plugins/#{p}.yml"))}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_block_params
      params.require(:content_block).permit(:content_area_id, :name, :content_type, :content, :default, :timings, :plugin_options)
    end
end
