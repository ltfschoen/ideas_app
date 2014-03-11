require 'test_helper'

class PostTest < ActiveSupport::TestCase
  context "validations" do # flexible syntax
  	should "require body with post" do
  		post = Post.new
  		refute post.save, "save the post without a body"
  		# same as "assert !post.save"
  	end
  	validate_presence_of :name
  	validate_presence_of :email
  	# validate_uniqueness_of :name
  end

  context "associations" do # flexible syntax
  	should have_many :comments
  	should belong_to :user
  end
end
