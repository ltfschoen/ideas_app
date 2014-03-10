require 'test_helper'

class PostTest < ActiveSupport::TestCase
  context "validations" do # flexible syntax
  	should "require body with post" do
  		post = Post.new
  		refute post.save, "save the post without a body"
  		# same as "assert !post.save"
  	end
  end
end
