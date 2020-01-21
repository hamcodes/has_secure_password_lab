class SessionsController < ApplicationController

  def login 
  end

  def create 
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id 
          redirect_to welcome_homepage_path 
      else
          render :login
      end
  end 
end