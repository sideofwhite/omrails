class Question < ActiveRecord::Base
extend FriendlyId
friendly_id :body, use: :slugged

has_attached_file :image, styles: { :small => "400x250>", :medium => "320x240>", :large => "740x340>" }


validates :body, presence: true
validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                             size: { less_than: 5.megabytes }
belongs_to :user
acts_as_votable
belongs_to :comment, :counter_cache => true
has_one :answer
has_many :pictures


 def image_remote_url=(url_value)
          self.image = URI.parse(url_value) unless url_value.blank?
          super
  end

end
