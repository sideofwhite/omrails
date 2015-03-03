class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
extend FriendlyId
friendly_id :name, use: :slugged

include PublicActivity::Model
tracked only: :create, owner: ->(controller, model) { controller && controller.current_user }
tracked only: :create, recipient: ->(controller, model) { model && model }


dragonfly_accessor :image 
has_attached_file :image, :default_url => 'http://i.imgur.com/ijGMsx5.png', :styles => { :thumb => "100x200>" }
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  has_many :posts
  has_many :comments
  has_many :questions
  has_many :pictures
  has_many :answers   
  has_many :links
  acts_as_voter  

  validates :name, presence: true
  validates_confirmation_of :password
  validates_uniqueness_of :name
  
 def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.twitter = auth.info.nickname
    user.image = URI.parse(auth.info.image.sub("_normal", "")) if auth.info.image?
  end
end

def portrait(size)

    # Twitter
    # mini (24x24)                                                                  
    # normal (48x48)                                            
    # bigger (73x73)                                                
    # original (variable width x variable height)

    if self.image.include? "twimg"

        # determine filetype        
        case 
        when self.image.downcase.include?(".jpeg")
            filetype = ".jpeg"
        when self.image.downcase.include?(".jpg")
            filetype = ".jpg"
        when self.image.downcase.include?(".gif")
            filetype = ".gif"
        when self.image.downcase.include?(".png")
            filetype = ".png"
        else
            raise "Unable to read filetype of Twitter image for User ##{self.id}"
        end

        # return requested size
        if size == "original"
            return self.image
        else
            return self.image.gsub(filetype, "_#{size}#{filetype}")
        end

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
