module Api
  class GroupsController < BaseController

    def index
      if params[:name]
        @groups = Group.where(name: params[:name]).first
      else
        @groups = Group.find(params[:ids])
      end
      render json: @groups
    end

    def show
      @group = Group.find(params[:id])
      render json: @group
    end
  end
end
