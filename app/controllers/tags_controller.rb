class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
    @photo = Photo.find(params[:photo_id])
  end

  def edit
  end

  def create
    photo = Photo.find(params[:tag][:photo_id])
    @tag = photo.tags.new(tag_params)
    # @tag = Tag.new(tag_params)
    respond_to do |format|
      if photo.tags.create(tag_params)
        format.html { redirect_to "/photos/#{photo.id}", notice: "Tag was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: "Tag was successfully updated." }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: "Tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
