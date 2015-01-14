class Event < ActiveRecord::Base
extend FriendlyId
friendly_id :title, use: [:slugged, :history]

def should_generate_new_friendly_id?
  title_changed?
end


has_attached_file :image

validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                             size: { less_than: 100.megabytes }


belongs_to :post
belongs_to :user



end
