class UsersController < ApplicationController
    before_action :require_user, only: [:edit, :update, :delete]
    def index 
        @users = User.all
    end
    
    def show 
        @user = User.find(params[:id])
    end

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)

        if @user.save
             session[:user_id] = @user.id
            flash[:notice] = "Account created successfully!"
            redirect_to books_path
        else 
            render :new 
        end
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])

        if @user.update(user_params)
            flash[:notice] = "Update account succesffully!"
            redirect_to books_path
        else 
            render :edit
        end
    end

    def destroy 
        @user = User.find(params[:id])
        flash[:notice] = "Deleted Account Succesful"
        @user.destroy 
        session[:user_id] = nil; 
        redirect_to signup_path
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end
end