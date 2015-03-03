class Question < ActiveRecord::Base
extend FriendlyId
friendly_id :body, use: :slugged

def normalize_friendly_id(string)
  super[0..100]
end

has_attached_file :file


belongs_to :user
acts_as_votable
belongs_to :comment, :counter_cache => true
has_many :answers
has_many :links
has_many :pictures
acts_as_list


 def image_remote_url=(url_value)
          self.image = URI.parse(url_value) unless url_value.blank?
          super
  end

end
