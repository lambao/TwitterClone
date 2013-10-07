class UsersController < ApplicationController
    before_filter :signed_in_user, only: [:edit, :update, :index]
    before_filter :correct_user, only: [:edit, :update]
  	def new
     	@user = User.new
  	end
  	def create
  		@user = User.new(user_param)
  		if @user.save then
        sign_in @user
        flash[:success] = "Welcome to the Twitter Cloneeeee!"
        redirect_to @user
  		else
  			render 'new'
  		end
  	end
    def show
      @user = User.find(params[:id])
    end
    def index
      @users = User.all
    end
    def edit 
      @user = User.find(params[:id])
    end
    def update
      @user = User.find(params[:id])

      if !(@user.authenticate(params[:user][:current_password]))
        @user.errors.add(:current_password, "is invalid.")
        render 'edit'
        return
      else
        if @user.update_attributes(params[:user]) then
          flash[:success] = "Update successfull"
          redirect_to @user
        else
          render 'edit'
        end
      end
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def user_param
      params.require(:user).permit(:name, :displayName, :email, :password, :password_confirmation) 
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    private :user_param, :signed_in_user, :correct_user
end