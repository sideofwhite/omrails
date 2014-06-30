class UserMailer < ActionMailer::Base
  default from: "noreplypodium@gmail.com"

  def question_answer(answer, user) 
  @answer = answer
  @question = @answer.question
  @user = user
  mail(:to => @question.user.email, :subject => "Your question was answered!")  
  end
end
