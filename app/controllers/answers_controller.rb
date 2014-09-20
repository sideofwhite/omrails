class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
   @post = Post.friendly.find params[:post_id]
   @comments = @post.comments
   @links = @post.links.order(:created_at).limit(5)
   @questions = @post.questions.order("cached_votes_total desc")
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    
  @question = Question.friendly.find(params[:question_id]) 
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @skip_footer = true
    
    @answer = Answer.new(answer_params)
    @question = Question.friendly.find(params[:question_id])
    
    
    
    respond_to do |format|
      if @answer.save
        format.html { redirect_to post_comment_path(@question.comment.post, @question.comment) + "#question_#{@question.id.to_s}", notice: 'Answer posted' }
        
      else
        redirect_to root_path
        
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to :back, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:body, :question_id, :user_id)
    end
end
