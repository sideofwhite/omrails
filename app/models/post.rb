class Post < ActiveRecord::Base
extend FriendlyId
friendly_id :title, use: :slugged

has_attached_file :image, styles: { :large => "740x340>" }


validates :user_id, presence: true
validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                             size: { less_than: 100.megabytes }

belongs_to :user
acts_as_votable
acts_as_taggable
has_many :comments
has_many :links
has_many :questions, :through => :comments
has_many :pictures
geocoded_by :country
after_validation :geocode, :if => :country_changed?

 def next
    post.comments.where("id > ?", id).order("id ASC").first
  end


def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end

