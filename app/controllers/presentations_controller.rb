require 'zlib'
require 'rubygems/package'

class PresentationsController < ApplicationController
  before_action :set_presentation, only: [:show, :edit, :update, :destroy, :preview, :download]
  before_action :load_templates, except: [:index]

  # GET /presentations
  # GET /presentations.json
  def index
    @presentations = Presentation.all
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
  end

  # GET /presentations/1/preview
  def preview
    @template = @presentation.template
    @content_areas = @template.content_areas.all
    @content_blocks = @presentation.content_blocks.all
    render layout: false
  end

  # GET /presentations/1/download
  def download
    @template = @presentation.template
    @content_areas = @template.content_areas.all
    @content_blocks = @presentation.content_blocks.all

    html = ERB::new(File::read("#{Rails.root}/app/views/output-templates/#{@presentation.template.code}/index.html.erb")).result(binding)
    tar = StringIO.new
    Gem::Package::TarWriter.new(tar) { |writer|
      writer.add_file("index.html", 0644){|f| f.write(html) }
      media_folder = "media/#{@presentation.id}"
      writer.mkdir("media/#{@presentation.id}", 0644)
      @presentation.media_files.each do |mf|
        writer.add_file("#{media_folder}/#{mf.file_file_name}", 0644) {|f| f.write(File::read(mf.file.path)) }
      end
    }
    tar.seek(0)

    send_data tar.read, filename: "#{@presentation.name}.tar", type: 'application/x-tar', disposition: 'attachment'
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)

    respond_to do |format|
      if @presentation.save
        format.html { redirect_to edit_presentation_url(@presentation), notice: 'Presentation was successfully created.' }
        format.json { render :show, status: :created, location: @presentation }
      else
        format.html { render :new }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to @presentation, notice: 'Presentation was successfully updated.' }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to presentations_url, notice: 'Presentation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    def load_templates
      @templates = Template.order(:screen_type_id).all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.require(:presentation).permit(:name, :template_id)
    end
end