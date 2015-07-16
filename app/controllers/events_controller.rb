class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index

    @post = Post.friendly.find(params[:post_id])
    @events = @post.events.order('created_at desc')
  end

  # GET /events/1
  # GET /events/1.json
  def show

    @image_bottom = true 
    @post = Post.friendly.find(params[:post_id])
    @event = Event.friendly.find(params[:id])
    @questions = @event.questions.where(:hide => true).order('cached_votes_total desc')
    @comments = @event.comments.order("created_at desc")
    @article = Article.new
    @articles = @event.articles.order("created_at desc")
    @related = @event.post.questions.where(:hide => true).order('cached_votes_total desc')
  end

  # GET /events/new
  def new
    @skip_footer = true 
    @post = Post.friendly.find(params[:post_id])
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @skip_footer = true
    @post = Post.friendly.find(params[:post_id])
    @event = Event.friendly.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @post = Post.friendly.find(params[:post_id])
    @event = @post.events.create(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to post_event_path(@event.post, @event), notice: 'Event Published' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to post_event_path(@event.post, @event), notice: 'Event Updated' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :body, :link, :domain, :image, :categorization_ids => [])
    end
end
