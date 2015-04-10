class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @skip_footer = true 
    @post = Post.friendly.find(params[:post_id])
    @pictures = @post.pictures
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
     @post = Post.friendly.find(params[:post_id])
     @picture = Picture.find(params[:id])
  end

  # GET /pictures/new
  def new
    @post = Post.friendly.find(params[:post_id])
    render_forbidden and return unless can_edit?
    
  end

  # GET /pictures/1/edit
  def edit
    @skip_footer = true 
    @post = Post.friendly.find(params[:post_id])

  end

  # POST /pictures
  # POST /pictures.json
  def create
    @post = Post.friendly.find(params[:post_id])
    @picture = @post.pictures.new(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @post, notice: 'Picture posted.' }
        format.json { render action: 'show', status: :created, location: @picture }
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    @post = Post.friendly.find(params[:post_id])
     @picture = Picture.find(params[:id])
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @post, notice: 'Picture updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

     def can_edit?
    current_user.try(:admin?) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image_file_name, :image_content_type, :image_file_size, :post_id, :user_id, :description, :image_remote_url, :image)
    end
end