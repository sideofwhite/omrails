class Comment < ActiveRecord::Base
extend FriendlyId
friendly_id :user_name, use: [:slugged, :history]

def should_generate_new_friendly_id?
  title_changed?
end

def user_name
user.name 
end

def feed
  return "question" if title.present?
  return "image" if image.present?
  return "video" if video_url.present?
  return "tweet" if tweet.present?
  return "quote" if quote_author.present?
  return "link" if link.present?
  return "blank"
end


auto_html_for :video_url do
  html_escape
  youtube(:width =>  "100%", :height => "100%", :autoplay => false)
end

auto_html_for :tweet do
  html_escape
  twitter
end

has_attached_file :image, :styles => { :original => "560x" }
validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                             size: { less_than: 1.megabytes }

def body_format
  self.body.gsub(/<p>.<\/p>/,"")
end



validates :user_id, presence: true
acts_as_votable
acts_as_taggable
belongs_to :post, :counter_cache => true
belongs_to :user
has_many :questions, :dependent => :destroy
has_many :links, :through => :questions, :dependent => :destroy
has_many :categorizations
has_many :events, through: :categorizations

end
