module Api
  class GroupsController < BaseController

    def index
      @groups = Group.find(params[:ids])
      render json: @groups
    end

    def show
      @group = current_user.groups.find(params[:id])
      render json: @group
    end

  end
end
