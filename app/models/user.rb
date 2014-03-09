class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :ideas

  # make test pass
  after_create :send_welcome_email


  def send_welcome_email
  	# we need to create tests for the below functionality
	UserMailer.welcome(self).deliver
	# mailer.deliver
  end

end

