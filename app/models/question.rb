class Question < ActiveRecord::Base
extend FriendlyId
friendly_id :user_name, use: :slugged

def normalize_friendly_id(string)
  super[0..100]
end

def body_format
  self.body.gsub(/<p>.<\/p>/,"")
end

def user_name
user.name 
end



has_attached_file :file
validates_attachment :file, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                             size: { less_than: 1.megabytes }

belongs_to :user
acts_as_votable
belongs_to :comment, :counter_cache => true
has_many :answers
has_many :links, :dependent => :destroy
has_many :pictures
acts_as_list




 def image_remote_url=(url_value)
          self.image = URI.parse(url_value) unless url_value.blank?
          super
  end

end
