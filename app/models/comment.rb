class Comment < ActiveRecord::Base
acts_as_votable
belongs_to :post
belongs_to :user
has_many :questions
end
