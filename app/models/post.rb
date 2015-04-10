class Post < ActiveRecord::Base
extend FriendlyId
friendly_id :title, use: :slugged

has_attached_file :image, :styles => { :original => "30x30>" }


def body_format
  self.body.gsub(/<p>.<\/p>/,"")
end

scope :topcategory, where(:category => true)
scope :nothiddencategory, where(:category => false).where(:hide => false)
scope :hiddencategory, where(:category => false).where(:hide => false).limit(3)
scope :top, (select('posts.*, count(comments.id) as count_comments')
             .joins("left join comments on comments.post_id = posts.id and comments.created_at >= '#{Time.zone.now.beginning_of_day}'")
             .group('posts.id')
             .order('count_comments desc'))



scope :published, where(:hide => true)


validates :user_id, presence: true
validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                             size: { less_than: 2.megabytes }

belongs_to :user
acts_as_votable
acts_as_taggable
has_many :comments, :dependent => :destroy
has_many :links, :dependent => :destroy
has_many :questions, :through => :comments, :dependent => :destroy
has_many :pictures, :dependent => :destroy
has_many :events, :dependent => :destroy
has_many :articles, through: :events, :dependent => :destroy
acts_as_list


def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end

