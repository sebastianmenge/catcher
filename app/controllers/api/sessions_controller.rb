module Api
  class SessionsController < BaseController

    def create
      user = User.find_by_facebook_uid(params[:facebook_uid])
      data = if user
        session[:user_id] = user.id
        user
      else
        User.create_user(params[:session])
      end
      render json: {
        session: {
          oauth_token: data.oauth_token,
          user_id: data.id,
          user: {
            id: data.id,
            first_name: data.first_name,
            last_name: data.last_name
          }
        }
      }
    end

    def destroy
      session[:user_id] = nil
    end

  end
end
