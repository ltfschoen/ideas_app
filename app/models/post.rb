class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  validates :body, presence: true, uniqueness: true

    # make test pass
  after_create :send_welcome_email

  def send_welcome_email
  	# we need to create tests for the below functionality
	UserMailer.welcome(self).deliver
	# mailer.deliver
  end

end
