class SessionsController < ApplicationController
	def new
		# session[:protected_page] ||= request.referer
	end

	def create
		@user = User.where(:email => params[:email]).first
		if @user && @user.authenticate(params[:password])
			# session[:user_id] = @user.id
			if @user.auth_token
			else
				@user.auth_token = SecureRandom.urlsafe_base64
				@user.save
			end

			if params[:remember_me]
		      cookies.permanent[:auth_token] = @user.auth_token
		    else
		      cookies[:auth_token] = @user.auth_token  
		    end
			redirect_to :root, :notice => "Successfully loged in"
		else 
			flash.now[:alert]= "Incorrect email or password"
			render :new
		end
	end

	def destroy
		cookies.delete(:auth_token)
		redirect_to :root, :notice => "Logged out"
	end
end
