class Comment < ActiveRecord::Base
def to_param
	"#{id} #{body}".parameterize
end

acts_as_votable
belongs_to :post
belongs_to :user
has_many :questions
end
