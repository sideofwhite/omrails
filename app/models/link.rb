class Link < ActiveRecord::Base
include PublicActivity::Model
tracked owner: ->(controller, model) { controller && controller.current_user }
tracked recipient: ->(controller, model) { model && model.question.user }

acts_as_votable
belongs_to :question
belongs_to :user
validates :description, presence: true
validates :user_id, presence: true
end
