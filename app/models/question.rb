class Question < ActiveRecord::Base
extend FriendlyId
friendly_id :body, use: :slugged

def normalize_friendly_id(string)
  super[0..100]
end

include PublicActivity::Model
tracked only: :create, owner: ->(controller, model) { controller && controller.current_user }
tracked only: :create, recipient: ->(controller, model) { model && model.comment.user }

has_attached_file :image, styles: { :small => "400x250>", :medium => "320x240>", :large => "740x340>" }


validates :body, presence: true
validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                             size: { less_than: 5.megabytes }
belongs_to :user
acts_as_votable
belongs_to :comment, :counter_cache => true
has_many :answers
has_many :links
has_many :pictures


 def image_remote_url=(url_value)
          self.image = URI.parse(url_value) unless url_value.blank?
          super
  end

end
