class SessionsController < ApplicationController
	def new
		redirect_to root_url if logged_in?
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			if user.activated?
				log_in user
				params[:session][:remember_me] == '1' ? remember(user) : forget(user)
				redirect_back_or user
			else
				message  = "Konto nieaktywne. "
				message += "Wysłano link aktywujący konto - sprawdź swoją skrzynkę e-mail (również \"Spam\")"
				flash[:warning] = message
				redirect_to root_url
			end
		else
			flash.now[:danger] = 'Niepoprawne dane logowania'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
end
