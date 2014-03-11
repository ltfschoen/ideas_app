require 'test_helper'

class WeblinkTest < ActiveSupport::TestCase
  context "validations" do # flexible syntax
  	should "require url with post" do
  		post = Post.new
  		refute post.save, "save the post without a url"
  		# same as "assert !post.save"
  	end
  	validate_presence_of :name
  	validate_presence_of :url
  	validate_uniqueness_of :url
  end

  context "associations" do # flexible syntax
  	should have_many :comments
  	should belong_to :user
  end
end
