class Picture < ActiveRecord::Base

has_attached_file :image, :styles => { :medium => "400x300>" }

belongs_to :post
belongs_to :user
 

end
