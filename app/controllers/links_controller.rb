class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

   
def upvote
@link = Link.find params[:id]
@link.liked_by current_user
redirect_to post_links_path
end




  # GET /links
  # GET /links.json
  def index
 
   @links = @post.links.order(:created_at)
    
    
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @question = Question.friendly.find(params[:question_id])
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
     @question = Question.friendly.find(params[:question_id])
     @link = @question.links.new(link_params)
     question_id = @question.id
    
    respond_to do |format|
      if @link.save
        format.html { redirect_to post_comment_path(@question.comment.post, @question.comment) + "#question_#{@question.id.to_s}", notice: 'Answer posted' }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
     @question = Question.friendly.find(params[:question_id])
     @link = Link.find params[:id]
    @link.destroy
    respond_to do |format|
      format.html { redirect_to post_comment_path(@question.comment.post, @question.comment), notice: 'Answer deleted' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:post_id, :user_id, :URL, :description, :tag_list)
    end
end
