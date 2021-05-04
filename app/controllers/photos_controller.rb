class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]

  # GET /photos or /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1 or /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @concerts = Concert.all
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    @concerts = Concert.all
  end

  # POST /photos or /photos.json
  def create
    @photo = Photo.new(photo_params)
binding.pry
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: "Photo was successfully created." }
        # format.json { render :show, status: :created, location: @photo }
      else
        flash.now[:error] = 'That photo was NOT uploaded. All fields must be filled out. Please try again.'
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:name, :concert_date, :loved, :liked, :user_id, :concert_id, :concert_photo)
    end

    def create_photo_params
      hash = {}
      hash[:name] = params[:name]
      hash[:concert_date] = params[:concert_date]
    end
end
