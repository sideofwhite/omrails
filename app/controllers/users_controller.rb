class UsersController < ApplicationController
  def show
    
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question .order("created_at desc")
  @comment = @user.questions.order("created_at desc")
  end

  def upvoted  
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question.offset(5)
  end


   def interviews

    
  @user = User.friendly.find(params[:id])
  @questions = @user.get_voted Question
  @comments = @user.questions.order("created_at desc")
  end 

  def notifications 
    
  @activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id).where(:read => false)
  @notification_count = @activities.where(:read => false)
  
  end

   def allnotifications 
    
  @allnotifications = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id).page(params[:page]).per_page(5)
  
  respond_to do |format|
          format.html
          format.js #-> will call /app/views/users/index.js.erb
  end
  
  end



  def read_all_notification
   PublicActivity::Activity.where(recipient_id: current_user.id).update_all(:read => true)
  end    

  

end
