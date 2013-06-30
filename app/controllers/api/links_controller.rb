module Api
  class LinksController < BaseController
    def index
      @links = Link.find(params[:ids])
      render json: @links
    end
  end
end
