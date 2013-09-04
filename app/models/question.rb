class Question < ActiveRecord::Base
belongs_to :comment
has_one :answer
end
