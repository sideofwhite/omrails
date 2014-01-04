class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  def to_param
  "#{id} #{name}".parameterize
end

dragonfly_accessor :image 
has_attached_file :image, :styles => { :thumb => "100x200>" }
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :questions
  has_many :answers   
  acts_as_voter     


end
