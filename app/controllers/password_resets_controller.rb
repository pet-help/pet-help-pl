class PasswordResetsController < ApplicationController
	before_action :find_user, only: [:edit, :update]
	before_action :valid_user, only: [:edit, :update]
	before_action :check_expiration, only: [:edit, :update]

	def new
	end

	def create
		@user = User.find_by(email: params[:password_reset][:email].downcase)
		if @user
			@user.create_reset_digest
			@user.send_password_reset_email
			flash[:info] = "Wysłano e-mail z instrukcją resetu hasła."
			redirect_to root_url
		else
			flash.now[:danger] = "Nie znaleziono adresu e-mail."
			render 'new'
		end
	end

	def edit
	end

	def update
	  if params[:user][:password].empty?
	    @user.errors.add(:password, "can't be empty")
	    render 'edit'
	  elsif @user.update_attributes(user_params)
	    log_in @user
	    flash[:success] = "Hasło zostało zmienione."
	    redirect_to @user
	  else
	    render 'edit'
	  end
	end

		private

	def user_params
	  params.require(:user).permit(:password, :password_confirmation)
	end

	def find_user
		@user = User.find_by(email: params[:email])
	end

	# Confirms a valid user.
	def valid_user
		redirect_to root_url unless @user && @user.activated? && @user.authenticated?(:reset, params[:id])
	end
	
	# Checks expiration of reset token.
	def check_expiration
	  if @user.password_reset_expired?
	    flash[:danger] = "Link resetujący utracił ważność."
	    redirect_to new_password_reset_url
	  end
	end

end
