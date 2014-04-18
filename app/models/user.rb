class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
extend FriendlyId
friendly_id :name, use: :slugged

dragonfly_accessor :image 
has_attached_file :image, :styles => { :thumb => "100x200>" }
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  has_many :posts
  has_many :comments
  has_many :questions
  has_many :answers   
  acts_as_voter   
  
 def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.nickname
    user.image = URI.parse(auth.info.image) if auth.info.image?
  end
end

def self.new_with_session(params, session)
  if session["devise.user_attributes"]
    new session["devise.user_attributes"] do |user|
      user.attributes = params
      user.valid?
    end
  else
    super
  end
end

def password_required?
  false
end

def email_required?
  super && provider.blank?
end

end
