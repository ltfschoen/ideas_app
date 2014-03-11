class Weblink < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable 

  validates :url, presence: true, uniqueness: true

end
