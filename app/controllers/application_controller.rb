class ApplicationController < ActionController::Base
    def require_user 
        if !helpers.logged_in?  
            flash[:notice] = "You need to log in first!"
            redirect_to login_path
        end
    end

    def require_same_user 
        if helpers.current_user != @book.user && !helpers.current_user.admin?
            flash[:notice] = "Unauthorized!"
            redirect_to helpers.current_user
        end
    end
end
