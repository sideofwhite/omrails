class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


 def upvote
@comment = Comment.friendly.find params[:id]
@comment.liked_by current_user
end

  def sort
  params[:comment].each_with_index do |id, index|
    Comment.update_all({position: index+1}, {id: id})
  end
  render nothing: true
end

def unpublished 
  @comment = Comment.friendly.find params[:id]
  @hidden = @comment.questions.where(:hide => false).order('created_at desc')
end

  # GET /comments
  # GET /comments.json
  def index
     @post = Post.friendly.find(params[:post_id])
     @questions = @post.questions
     @links = @post.links.order(:created_at).limit(5)
     @comments = @post.comments.order('cached_votes_total desc')
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  
  @post = Post.friendly.find(params[:post_id])
  @comment = Comment.friendly.find params[:id]
  @commentnext = @post.comments.friendly.find(params[:id])
  @link = Link.new
  @comments = @post.comments.order('cached_votes_total desc').limit(3)
  @questions = @comment.questions.where(:hide => true).order('cached_votes_total desc').page(params[:page]).per_page(1)
  @published = @comment.questions.where(:hide => true).order('created_at')
  @related = @comment.post.comments.order(position: :asc).where("position > ?", @comment.position).limit(2)
  @hidden = @comment.questions.where(:hide => false).order('created_at desc')
   respond_to do |format|
        format.html
        format.js
        format.json
    end

  end


  def unansweredquestions
  @post = Post.friendly.find(params[:post_id])
  @comment = Comment.friendly.find params[:id]  
  @unanswered = @comment.questions.order("created_at desc").offset(3)
  end 

  def delete_content
  respond_to do |format|               
    format.js
  end        
end 

  # GET /comments/new
  def new

    @post = Post.friendly.find(params[:post_id])
    @links = @post.links.order(:created_at).limit(5)
  end

  # GET /comments/1/edit
  def edit
    @skip_footer = true  
   render_forbidden and return unless can_edit? 
  @post = Post.friendly.find(params[:post_id])  
  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_comment_path(@post, @comment), notice: 'Question Asked' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    render_forbidden and return unless can_edit?
    @post = Post.friendly.find(params[:post_id])  

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_comment_path(@comment.post, @comment), notice: 'Question Updated' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post = Post.friendly.find(params[:post_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.friendly.find(params[:id])
    end

      def can_edit?
  current_user.try(:admin?) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :title, :tweet, :quote_author, :body, :image, :about, :active, :info, :link, :video_url, :published, :tag_list, :event_ids => [])
    end
end
