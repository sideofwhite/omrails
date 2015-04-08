class Comment < ActiveRecord::Base
extend FriendlyId
friendly_id :title, use: [:slugged, :history]

def should_generate_new_friendly_id?
  title_changed?
end


scope :nothidden, where(:hide => false)


def body_format
  self.body.gsub(/<p>.<\/p>/,"")
end


validates :title, presence: true
validates :user_id, presence: true
acts_as_votable
acts_as_taggable
belongs_to :post, :counter_cache => true, :dependent => :destroy
belongs_to :user
has_many :questions
has_many :categorizations
has_many :events, through: :categorizations

end
