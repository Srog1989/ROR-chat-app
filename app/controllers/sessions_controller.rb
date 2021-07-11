class SessionsController < ApplicationController

    def new
        
    end

    def create
       user = user.find_by(username: params[:session] [:username])
       if user && user.authenticate(params [:session] [:password])
        session[:user_id] = user.id
        # flash[:success] = "Login successful"
        redirect_to root_path
       else
        # flash.now[:error] = "Incorrect username or password"
        render 'new'
       end
    end
end