class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @greeting = "Hi"
    @user = user

    #mail to: "to@example.org"
    mail to: user.email
  end
end
