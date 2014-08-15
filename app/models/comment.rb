class Comment < ActiveRecord::Base
extend FriendlyId
friendly_id :title, use: :slugged

def next
    post.comments.where("id > ?", id).order('cached_votes_total desc').first
end

has_attached_file :image, :styles => { :medium => "400x300>" }

validates :title, presence: true
validates :user_id, presence: true
acts_as_votable
belongs_to :post, :counter_cache => true
belongs_to :user
has_many :questions

end
