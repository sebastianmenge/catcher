module Api
  class GroupsController < BaseController

    def create
      project = Project.find(params[:group][:project_id])
      @group = project.groups.create!(params[:group])

      render json: @group
    end
  end
end
