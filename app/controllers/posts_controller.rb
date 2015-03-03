class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


def upvote
@post = Post.friendly.find(params[:id])
@post.liked_by current_user
redirect_to posts_path
end


  # GET /posts
  # GET /posts.json
  def index
    @skip_footer = true  
  @skip_bottom = true  
if params[:tag]
@posts = Post.where(:top => false, :hide => false).tagged_with(params[:tag]).order("created_at desc").page(params[:page]).per_page(3)
@toppost = Post.where(:top => true, :hide => false).tagged_with(params[:tag]).order("created_at").limit(1) 
@hidden = Post.hiddencategory.order("created_at desc").tagged_with(params[:tag]) 

else
@posts = Post.where(:top => false, :hide => false).order("position").page(params[:page]).per_page(3)
@toppost = Post.where(:top => true, :hide => false).order("created_at").limit(1)  


end

respond_to do |format|
  format.html
  format.js
 end
end
    
 

  # GET /posts/1
  # GET /posts/1.json
  def show
  @topanswers = true   
  @skip_footer = true  
  @post = Post.friendly.find(params[:id])
  @answersmore = @post.questions.where(:hide => true, :recommend => false).order('cached_votes_total desc').limit(3)
  @ordered = @post.questions.where(:hide => true, :recommend => true).order("position").page(params[:page]).per_page(2)
  @answers = @post.questions.where(:hide => true)
  @topquestions = @post.comments.order('comments.questions_count desc').limit(3)
  @articles = @post.articles.order("created_at desc").limit(5)
  @comment = Comment.new
  @events = @post.events.order("created_at desc").limit(2)
  @related = @post.find_related_tags
  end


  def admin
  @skip_footer = true 
  @posts = Post.where(:top => false, :hide => false).order("position")
  @toppost = Post.where(:top => true, :hide => false).order("created_at").limit(1)
 end

 def sort
  params[:post].each_with_index do |id, index|
    Post.update_all({position: index+1}, {id: id})
  end
  render nothing: true
end


    def ordered
    @skip_footer = true  
    render_forbidden and return unless can_edit?
  @post = Post.friendly.find(params[:id])
  @ordered = @post.questions.where(:hide => true, :recommend => true).order("position")
  @comment = Comment.new
  end

  def showanswersmore
  @skip_footer = true  
  @post = Post.friendly.find(params[:id])
  @questions = @post.questions.where(:hide => true, :recommend => false).order('cached_votes_total desc').page(params[:page]).per_page(2)
  @comment = Comment.new
  end

  def showtopquestion
  @skip_footer = true 
  @post = Post.friendly.find(params[:id])
  @comments = @post.comments.order('comments.questions_count desc').page(params[:page]).per_page(2)
  @comment = Comment.new 

end

  # GET /posts/new
  def new
    @skip_footer = true 
    render_forbidden and return unless can_edit?
    @posts = Post.all
    @post = current_user.posts.new
    
  end

  # GET /posts/1/edit
  def edit
    @skip_footer = true 
    render_forbidden and return unless can_edit?
 @post = Post.friendly.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    render_forbidden and return unless can_edit?
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
    render_forbidden and return unless can_edit?
   @post = Post.friendly.find(params[:id])
   
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
    @post = Post.friendly.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Story deleted'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def can_edit?
  current_user.try(:admin?) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :image, :image_remote_url, :title, :country, :tag_list, :link, :domain, :top, :hide, :category, :event)
    end
end
