class ApplicationController < ActionController::Base
    def current_user
        #  The  ||=  operator returns the instance variable if it represents a truthy value, or else execute the right side of the expression.
        # use cache to prevent multiple db load.
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authorized?
        redirect_to login_path unless logged_in?
    end


    helper_method :current_user, :logged_in?, :can_create, :can_edit
end
