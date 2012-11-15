class UserController < ApplicationController
	def new
		render :partial => 'form'
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to :root, :notice => "User created"
		else render :action => 'new'
		end
	end
end
