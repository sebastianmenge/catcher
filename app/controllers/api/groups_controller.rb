module Api
  class GroupsController < BaseController

    def index
      @groups = current_user.groups
      render json: @groups
    end

    def show
      @group = current_user.groups.find(params[:id])
      render json: @group
    end

  end
end
