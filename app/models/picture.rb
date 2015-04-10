class Picture < ActiveRecord::Base

has_attached_file :image, :styles => { :small => "300x300>" }
validates :image, presence: true

belongs_to :post
belongs_to :user
 

end
