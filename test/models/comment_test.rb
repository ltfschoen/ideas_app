require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  context "associations" do # flexible syntax
  	should belong_to :user
  	should belong_to :commentable
  end
end
