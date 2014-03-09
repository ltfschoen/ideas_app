require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  context "welcome" do

  	setup do
  		@user = users(:fred)
  		@mail = UserMailer.welcome(@user) # welcome needs to take extra argument
  	end

  	should "set up default variables" do
	    assert_equal "Welcome", @mail.subject
	    assert_equal ["from@example.com"], @mail.from
	    #assert_match "Hi", @mail.body.encoded
	end

  	should "deliver the email" do
		@mail.deliver
		# class that sends mail is ActionMailer::Base.deliveries 
		# stores mail in array called 'deliveries'
		refute_empty ActionMailer::Base.deliveries	
  	end
  	# pass user to welcome method
  	should "email the user that we pass to" do
  		assert_equal [@user.email], @mail.to
  	end

  	should "user the user's name in the mail body" do
  		assert_match "Hello #{@user.name}", @mail.body.encoded
  	end
  end # welcome

end

  # test "welcome" do
  #   mail = UserMailer.welcome
  #   assert_equal "Welcome", mail.subject
  #   assert_equal ["to@example.org"], mail.to
  #   assert_equal ["from@example.com"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end