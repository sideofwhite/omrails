class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
 def upvote
@question = Question.friendly.find params[:id]
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
    
  def sort
  params[:question].each_with_index do |id, index|
    Question.update_all({position: index+1}, {id: id})
  end
  render nothing: true
end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @image_bottom = true 
  @skip_footer = true   
  @comment = Comment.friendly.find params[:comment_id]
  @question = Question.friendly.find params[:id]
  @published = @comment.questions.where(:hide => true).order('created_at')
  @related = @question.comment.questions.where(:hide => true).order('cached_votes_total desc')
  
  end

  # GET /questions/new
  def new
    @skip_footer = true  
  @comment = Comment.friendly.find(params[:comment_id])
  render_forbidden and return unless can_answer?
  end

  # GET /questions/1/edit
  def edit
   @skip_footer = true  
  @comment = Comment.friendly.find(params[:comment_id]) 
  @question = Question.friendly.find(params[:id])
   render_forbidden and return unless can_edit?
  end

  # POST /questions
  # POST /questions.json
  def create
   
    @comment = Comment.friendly.find(params[:comment_id])
    @question = @comment.questions.new(question_params)
    
    respond_to do |format|
      if @question.save
        format.html { redirect_to comment_question_path(@question.comment, @question), notice: 'Answer Posted' }
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
    
    @comment = Comment.friendly.find(params[:comment_id])
    @question = Question.friendly.find(params[:id])
    render_forbidden and return unless can_edit?
    respond_to do |format| 
      if @question.update(question_params)
        format.html { redirect_to comment_question_path(@question.comment, @question), notice: 'Answer Updated'  }
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
    @comment = Comment.friendly.find(params[:comment_id])
    @question = Question.friendly.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to post_comment_path(@comment.post, @comment), notice: 'Answer Deleted' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.friendly.find(params[:id])
    end

     def can_edit?
    current_user == @question.user
    end

    def can_answer?
   @comment.published == true
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:body, :title, :comment_id, :user_id, :file, :caption, :hide, :recommend, :position)
    end
end
