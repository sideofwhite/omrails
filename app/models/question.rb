class Question < ActiveRecord::Base
validates :body, presence: true
validates :title, presence: true
validates :user_id, presence: true

belongs_to :user
acts_as_votable
belongs_to :comment
has_many :pictures



end
