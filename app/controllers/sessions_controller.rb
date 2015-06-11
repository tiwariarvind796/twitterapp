class SessionsController < ApplicationController

	def new
	end


	def create
	user = User.from_omniauth(env["omniauth.auth"])
	debugger
	if  user.email.blank?
		redirect_to auth_edit_path(id: user.id)
	else
	session[:user_id] = user.id
	redirect_to root_url, notice: "Signed in!"
	end
  end

	def destroy
	session[:user_id] = nil
	redirect_to root_url, notice: "Signed out!"
	end

	def failure
	redirect_to root_url, alert: "Authentication failed, please try again."
	end

	def edit
	 @user = User.where(id: params[:id]).first 
	end


	 def update
	 user = User.where(id: params[:id]).first
	 if user.update_attribute(:email, params[:email])
	 session[:user_id] = user.id
	 redirect_to root_url
	 else
	 render 'edit'
     end
    end	      
  end
