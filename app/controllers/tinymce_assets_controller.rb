class TinymceAssetsController < ApplicationController
  respond_to :json



  def create
    geometry = Paperclip::Geometry.from_file params[:file]
    question = current_user.questions.create(file_params)

    render json: {
      image: {
        url:    question.file.url,
        height: geometry.height.to_i,
        width:  geometry.width.to_i
      }
    }, layout: false, content_type: "text/html"
  end

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def file_params
      params.permit(:file, :alt, :hint)
    end


end