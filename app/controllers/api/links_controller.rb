module Api
  class LinksController < BaseController
    def index
      @links = Link.find(params[:ids])
      render json: @links
    end

    def create
      group = current_user.projects.find(params[:link][:project_id]).groups.find(params[:link][:group_id])
      @link = group.links.create!(params[:link])
      render json: @link
    end
  end
end
