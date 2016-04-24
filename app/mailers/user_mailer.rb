class UserMailer < ApplicationMailer

	def account_activation(user)
		@user = user
		mail to: user.email, subject: "Aktywacja konta w serwisie pet_help_pl"
	end

	def password_reset(user)
	  @user = user
	  mail to: user.email, subject: "Reset hasła w serwisie pet_help_pl"
	end
end
