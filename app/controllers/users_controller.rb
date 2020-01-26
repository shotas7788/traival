class UsersController < ApplicationController
    
    def show
      @user = User.find_by(id: params[:id])
    end
     
    def following
      @title = "フォロー"
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show_follow'
    end
 
    def followers
      @title = "フォロワー"
      @user  = User.find(params[:id])
      @users = @user.followers
      render 'show_follow'
    end
end
