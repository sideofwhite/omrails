class Post < ActiveRecord::Base
extend FriendlyId
friendly_id :title, use: :slugged

has_attached_file :image, styles: { :large => "740x340>" }

scope :hide, where(:hide => false).where(:top => false)
scope :topcategory, where(:category => true)
scope :nothiddencategory, where(:category => false).where(:hide => false)
scope :hiddencategory, where(:category => false).where(:hide => nil).limit(3)
scope :featured, where(:top => true).where(:hide => false)
scope :top, (select('posts.*, count(comments.id) as count_comments')
             .joins("left join comments on comments.post_id = posts.id and comments.created_at >= '#{Time.zone.now.beginning_of_day}'")
             .group('posts.id')
             .order('count_comments desc'))



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





def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end

