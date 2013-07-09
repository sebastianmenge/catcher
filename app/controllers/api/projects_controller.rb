module Api
  class ProjectsController < BaseController

    def index
      @projects = current_user.projects
      render json: @projects
    end

    def show
      @project = current_user.projects.find(params[:id])
      render json: @project
    end

  end
end
