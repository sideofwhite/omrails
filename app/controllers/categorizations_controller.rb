class CategorizationsController < ApplicationController
	private
	 def categorizations_params
      params.require(:post).permit(:comment_id, :event_id)
    end
end
