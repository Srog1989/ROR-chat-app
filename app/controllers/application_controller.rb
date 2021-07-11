class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:error] = "Please log in to proceed"
            redirect_to login_path
        end
    end
end
