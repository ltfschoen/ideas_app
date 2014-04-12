class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :ideas
  has_many :weblinks
  has_many :posts
  has_many :comments 

  belongs_to :referred_by, class_name: 'User' #
  has_many :referrals, class_name: 'User', foreign_key: 'referred_by_id'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end

