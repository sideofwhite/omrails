class Picture < ActiveRecord::Base

has_attached_file :image, :styles => { :original => "30x30>" }
validates :image, presence: true

belongs_to :post
belongs_to :user
 

end
