class UsersController < ApplicationController
after_action :read_all_notification, only: [:notifications]


  def show
  @skip_footer = true  
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question .order("created_at desc")
  @comment = @user.questions.order("created_at desc")
  @links = @user.links.order("created_at desc")
  end

   def upvotes
    
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question .order("created_at desc").page(params[:page]).per_page(10)
  
  end

  def allanswers
    
  @user = User.friendly.find(params[:id])
  @comments = @user.questions.order("created_at desc").page(params[:page]).per_page(10)
  
  end

 def allcomments
    
  @user = User.friendly.find(params[:id])
  @links = @user.links.order("created_at desc").page(params[:page]).per_page(10)
  
  end

  def upvoted  
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question.offset(5)
  end


   def interviews

    @skip_footer = true  
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question
  @links = @user.links.order("created_at desc")
  @comments = @user.questions.order("created_at desc")
  end 

    def usercomments

   @skip_footer = true  
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question
  @comment = @user.questions.order("created_at desc")
  @links = @user.links.order("created_at desc").page(params[:page]).per_page(10)
  end 

  def notifications
  @user = User.friendly.find(params[:id]) 
  render_forbidden and return unless can_edit?
  @activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id).where(:read => false)
  @notification_count = @activities.where(:read => false)
  
  end

   def read_all_notification
   PublicActivity::Activity.where(recipient_id: current_user.id).update_all(:read => true)
  end   

   def allnotifications 
    @user = User.friendly.find(params[:id])
    render_forbidden and return unless can_edit?
  @allnotifications = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id).page(params[:page]).per_page(15)
  
  respond_to do |format|
          format.html
          format.js #-> will call /app/views/users/index.js.erb
  end
  
  end


 private

    def can_edit?
     current_user == @user
    end
  

  

end
