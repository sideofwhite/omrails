class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
 def upvote
@question = Question.find params[:id]
@question.liked_by current_user
end


  # GET /questions
  # GET /questions.json
 
   
   def index 
  @comment = Comment.friendly.find params[:comment_id]
  @questions = @comment.questions.order('cached_votes_total desc')
  @comments = @comment.post.comments.order(:created_at).last(5)
  @answer = Answer.new
end
    


  # GET /questions/1
  # GET /questions/1.json
  def show
  @comment = Comment.friendly.find params[:comment_id]
  @comments = @comment.questions.order(:created_at).last(5)
  
  end

  # GET /questions/new
  def new
  @comment = Comment.friendly.find(params[:comment_id])
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @comment = Comment.friendly.find(params[:comment_id])
    @question = @comment.questions.new(question_params)
    
    respond_to do |format|
      if @question.save
        format.html { redirect_to post_comment_path(@comment.post, @comment) + "#question_#{@question.id.to_s}", notice: 'Question posted' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { redirect_to root_path }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format| 
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else            
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to post_comment_path(@question.comment.post, @question.comment) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:body, :title, :comment_id, :user_id, :image, :image_remote_url, :caption)
    end
end
