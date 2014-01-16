class Post < ActiveRecord::Base
has_attached_file :image, styles: { :small => "365x205>", :medium => "430x340>", :large => "740x340>" }

def to_param
	"#{id} #{title}".parameterize
end

validates :user_id, presence: true
validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                             size: { less_than: 5.megabytes }

belongs_to :user
acts_as_votable
acts_as_taggable
has_many :comments
has_many :links
has_many :questions, :through => :comments
has_many :pictures
geocoded_by :country
after_validation :geocode, :if => :country_changed?
def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end

