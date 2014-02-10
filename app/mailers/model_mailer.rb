class ModelMailer < ActionMailer::Base
  default from: "no-reply@trendmyhunch.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(record)
    @record = record
    mail to: "ltfschoen@gmail.com"
    subject: "Success! You did it."
  end
end
