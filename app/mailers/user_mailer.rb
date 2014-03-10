class UserMailer < ActionMailer::Base
  default from: "no-reply@trendmyhunch.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject

  def welcome(post)
  	# generic message to be sent to the user after providing feedback
    @greeting = "Hi"

    # current user (if logged in)
    @user = post.user

    @name = post.user.name
	@email = post.email
	@body = post.body

    mail to: @email

    # by convention will call user_mailer view welcome.text.erb (since in welcome method)
 
  end

    # def new_record_notification(record)
  #   @record = record
  #   mail to: "ltfschoen@gmail.com"
  #   subject: "Success! You did it."
  # end
end
