module Api
  class SessionsController < BaseController

    def create
      user = if current_user.present?
        update_oauth_token_for(current_user, params[:session])
        current_user
      else
        find = User.find_by_facebook_uid(params[:facebook_uid])
        db_user = if find.present?
          find
        else
          User.create_user(params[:session])
        end
        session[:user_id] = db_user.facebook_uid
        db_user
      end
      render json: {
        session: {
          oauth_token: user.oauth_token,
          user_id: user.id,
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email
        }
      }
    end

    def destroy
      session[:user_id] = nil
      render json: { message: 'ok'}, status: 200
    end

    private

    def update_oauth_token_for(user, payload)
      token, expires_in = payload.values_at("oauth_token", "token_expires_at")
      user.update_attribute :oauth_token, token
      user.update_attribute :token_expires_at, expires_in.to_i.seconds.from_now
    end
  end
end
