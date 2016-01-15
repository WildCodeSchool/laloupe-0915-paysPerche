class UsersController < ApplicationController
	include UsersHelper
	before_action :authenticate_user!
	def index
		@user = User.all
	end

	def mes_contacts
		@contacts = current_user.contacts
		@users = User.all
	end

	def show
		@qr = qrcode
		@user = User.find(params[:id])
		@contacts = current_user.contacts
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
				redirect_to root_path, notice: "\#{@user.first_name}\" a été modifié avec succés"
		else
			render 'edit', notice: "\#{@user.first_name}\" n'a pas été modifié"
		end
	end

	def mailgroupe
		@contacts = Contact.all
	end

	def postmail
		users = User.group_to_send(params).flatten!
		message = User.message_to_send(params)
		subject = User.email_subject(params)
		
		users.map do |user|
			ContactMailer.mail_groupe(user, subject, message).deliver_later!
		end
		redirect_to root_path, notice: "Mail bien envoyé"
		send_mail(params)
		redirect_to root_path, notice: "Mail(s) bien envoyé(s)"
	end

	def share_contact
		binding.pry
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :function, :phone, :email, :password)
	end
end

end
