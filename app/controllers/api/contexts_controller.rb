module Api
  class ContextsController < BaseController

    def index
      @contexts = current_user.contexts
      render json: @contexts
    end

    def show
      @context = current_user.contexts.find(params[:id])
      render json: @context
    end

  end
end
