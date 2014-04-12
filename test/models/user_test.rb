require 'test_helper'

class UserTest < ActiveSupport::TestCase

  context "associations" do
  	should have_many :posts
  	should have_many :referrals
  	should have_many :referred_by
  end

  context "validations" do
  	should validate_presence_of :name
  	should validate_presence_of :email
  	should validate_uniqueness_of :email
  end
  # test "the truth" do
  #   assert true
  # end
  context "callbacks" do
	context "after create" do
		should "run send welcome email" do
			# use Mocha to implement
			user = User.new(name: 'Bob', email: 'bob@example.com', password: 'password')
			# set up expectation ahead of time
			# the expectation is the assert
			# expects is using the Mocha GEM
			user.expects(:send_welcome_email)
			# triggered by user save

			user.save
		end
	end
  end

  context "#send_welcome_email" do
  	# want to Mock this out so its quick and done
  	should "call deliver on a welcome email" do
  		fred = users(:fred)

		# want what gets returned to be Mocked out (fake pretend mock object)
		my_mailer = mock
		# we just want to test that deliver gets called on this object
		my_mailer.expects(:deliver)

		UserMailer.expects(:welcome).with(fred).returns(my_mailer)

		# we also care that gets returned by this usermailer
  		fred.send_welcome_email
  	end
  end


end
