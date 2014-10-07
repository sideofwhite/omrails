class Comment < ActiveRecord::Base
extend FriendlyId
friendly_id :title, use: [:slugged, :history]

def should_generate_new_friendly_id?
  title_changed?
end


scope :nothidden, where(:hide => false)

include PublicActivity::Model
tracked except: :create, owner: ->(controller, model) { controller && controller.current_user }
tracked except: :create, recipient: ->(controller, model) { model && model.user }




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
