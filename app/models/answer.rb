class Answer < ActiveRecord::Base
 extend FriendlyId
  friendly_id :body, use: :slugged

belongs_to :question, counter_cache: true
end
