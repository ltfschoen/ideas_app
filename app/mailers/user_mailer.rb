class UserMailer < ActionMailer::Base
  default from: "no-reply@trendmyhunch.herokuapp.com"
  after_action :set_delivery_options
  #, :set_business_headers

  def feedback_message(name, email, message)
	@name = params[:name]
	@email = params[:email]
  	@message = params[:message]
    @url  = 'http://trendmyhunch.herokuapp.com'
    email_with_name = "#{@name} <#{@email}>"
    delivery_options = { user_name: company.smtp_user,
                         password: company.smtp_password,
                         address: company.smtp_host }
    mail(to: email_with_name,
    	 body: @message,
         content_type: "text/html",
    	 subject: "Feedback from Trendmyhunch!", 
    	 delivery_method_options: delivery_options
    	) do |format|
      	format.html { render layout: 'feedback_message' }
      	format.text
    end
  end

  # def welcome_email(user, email_body)
  #   @user = user
  #   @url  = 'http://trendmyhunch.herokuapp.com'
  #   email_with_name = "#{@user.name} <#{@user.email}>"
  #   delivery_options = { user_name: company.smtp_user,
  #                        password: company.smtp_password,
  #                        address: company.smtp_host }
  #   mail(to: email_with_name,
  #   	 body: email_body,
  #        content_type: "text/html",
  #   	 subject: "Welcome to Trendmyhunch!", 
  #   	 delivery_method_options: delivery_options
  #   	) do |format|
  #     	format.html { render layout: 'user_mailer' }
  #     	format.text
  #   end
  # 
  # end

  #private
 
    #def set_delivery_options
      # You have access to the mail instance,
      # @business and @user instance variables here
    #  if @business && @business.has_smtp_settings?
    #    mail.delivery_method.settings.merge!(@business.smtp_settings)
    #  end
    #end

    #def set_business_headers
    #  if @business
    #    headers["X-SMTPAPI-CATEGORY"] = @business.code
    #  end
    #end

end
