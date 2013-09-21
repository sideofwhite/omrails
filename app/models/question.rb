class Question < ActiveRecord::Base

acts_as_votable
belongs_to :comment
has_one :answer
belongs_to :user

end
