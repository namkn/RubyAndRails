class AuthenticationsController < ApplicationController
	def create
    omniauth = request.env['omniauth.auth']
    #for debug
    # @provider = omniauth['provider']
    @uid = omniauth['uid']
    @email = omniauth['info']['email']
    @fname = omniauth['info']['first_name']
    @lname = omniauth['info']['last_name']
    @auth_yaml = omniauth.to_yaml
    
    @user = User.find_by_email(@email)
    if @user
    # @authentication = Authentication.where(uid:  omniauth['uid'], provider: omniauth['provider']).first
    # if @authentication
    #   #already have the authentication, sign in the user
    #   session[:user_id] = @authentication.user.id
        if @user.auth_token
        else
            @user.auth_token = SecureRandom.urlsafe_base64
            @user.save
        end
        cookies[:auth_token] = @user.auth_token
        redirect_to root_url, notice: "You succesfully signed in!"
    # els
    # if current_user
      #user logged in, add the authenticaiton
      # @authentication = current_user.authentications.build
      # @authentication.provider = omniauth['provider']
      # @authentication.uid =  omniauth['uid']
      # @authentication.save!
      # redirect_to root_url, notice: "You have already logged in"
    else
      #user logged out, add user and authentication
      @user = User.new
      @user.email = @email
      @user.password_digest = 0
      @user.fname = @fname
      @user.lname = @lname
      # @authentication = @user.authentications.build
      # @authentication.provider = omniauth['provider']
      # @authentication.uid =  omniauth['uid']
      @user.save!
      # @authentication.save!
      # session[:user_id] = @user.id
      cookies[:auth_token] = @user.auth_token
      redirect_to root_url, notice: "You succesfully logged in!"
    end
  end

end
