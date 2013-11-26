class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(email)
    mail to:email, subject: "Thanks so much for signing up!"
  end

end
