module Api
  class LinksController < BaseController
    def index
      @links = Link.find(params[:ids])
      render json: @links
    end

    def create
      group = current_user.contexts.find(params[:link][:context_id]).groups.first
      @link = group.links.create(params[:link])
      render json: @link
    end
  end
end
