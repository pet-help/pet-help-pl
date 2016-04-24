class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: :destroy

	def show
		@user = User.find(params[:id])
	end

	def new
		redirect_to root_url if logged_in?
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			# log_in @user
			# flash[:success] = "Welcome to the Sample App!"
			# redirect_to user_url(@user)

			@user.send_activation_email
			flash[:info] = "Wiadomość z linkiem aktywującym została wysłana na adres #{@user.email}."
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		
	end

	def index
		@users = User.paginate(page: params[:page])
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Profil zaktualizowany"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
	  User.find(params[:id]).destroy
	  flash[:success] = "Użytkownik usunięty"
	  redirect_to users_url
	end

	private

	def user_params
		params.require(:user).permit(:email, :password,
																 :password_confirmation)
	end

	# Before filters

	# Confirms a logged-in user.
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "Zaloguj się."
			redirect_to login_url
		end
	end

	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_url) unless current_user?(@user)
	end

	# Confirms an admin user.
	def admin_user
	  redirect_to(root_url) unless current_user.admin?
	end

end
