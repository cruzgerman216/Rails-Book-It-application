class SessionsController < ApplicationController
   before_action :require_user, only: [:destroy]
   def new
   end 

   def create 
      user = User.find_by(email: params[:email])

      if user && user.authenticate(params[:password])
         session[:user_id] = user.id
         flash[:notice] = "Login Successful"
         redirect_to user
      else 
         flash[:notice] = "Unsuccessful Login"
         render :new
      end
   end

   def destroy
       session[:user_id] = nil 
       flash[:notice] = "Logout successful"
       redirect_to login_path
   end
end