class Comment < ActiveRecord::Base
extend FriendlyId
friendly_id :title, use: :slugged


has_attached_file :image, :styles => { :medium => "400x300>" }

validates :user_id, presence: true
acts_as_votable
belongs_to :post
belongs_to :user
has_many :questions

end
