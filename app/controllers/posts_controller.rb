class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

   
   def upvote
@post = Post.find params[:id]
@post.liked_by current_user
redirect_to posts_path
end


  # GET /posts
  # GET /posts.json
  def index
   
if params[:tag]
@posts = Post.tagged_with(params[:tag])
else
@posts = Post.all
end
end
    
  
 

  # GET /posts/1
  # GET /posts/1.json
  def show
  @post = Post.find(params[:id])
  @comments = Post.order("created_at desc")
  @links = @post.links.order(:created_at).limit(2)

  end

  # GET /posts/new
  def new
    @posts = Post.all
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
 @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    
    @post = current_user.posts.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
   @post = Post.find(params[:id]) 
   
   respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :image, :image_remote_url, :title, :country, :tag_list)
    end
end
