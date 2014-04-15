class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

 def top
@comments = Comment.order("cached_votes_total desc")
end  
 


 def upvote
@comment = Comment.friendly.find params[:id]
@comment.liked_by current_user
redirect_to post_comment_path
end

def comments_count
  questions.count
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
  @question = Question.new
  @answer = Answer.new
  @comments = @post.comments.order('cached_votes_total desc').limit(3)
  @questions = @comment.questions.order('cached_votes_total desc')
  end

  # GET /comments/new
  def new
    @post = Post.friendly.find(params[:post_id])
    @links = @post.links.order(:created_at).limit(5)
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_comment_path(@post, @comment), notice: 'Posted Successfully' }
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
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
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
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :title, :subtitle, :body, :image)
    end
end
