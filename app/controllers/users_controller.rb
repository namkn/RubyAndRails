class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		#@user1 = User.where(:username => params[:user][:username]).first
		@user = User.new(params[:user])
		# if @user1
		# 	render :action => 'new', :notice => "Username existed"
		if @user.save
			redirect_to :root, :notice => "User created"
		else
			render :action => 'new'
		end
	end

	def show

	end

	def edit
		@user = current_user
	end

	def update
		if current_user.update_attributes(params[:user])
			redirect_to :action => "show", :notice => "Profile updated"
		else
			render :edit
		end
	end

	def destroy
		@user = current_user
		session[:user_id] = nil
		if(@user.destroy) 
      		redirect_to :root, :notice => "User deleted"
    	end
	end
end
