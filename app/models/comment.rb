class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true # rails will not expect id & type column for polymorphic (type will need to be renamed 'kind'
end
