class UsersController < ApplicationController
	include ApplicationHelper
	include UsersHelper
	before_action :is_admin, only: [:mailgroupe, :postmail]
	before_action :authenticate_user!
	def index
		@user = User.all
	end

	def mes_contacts
		@contacts = User.find(params[:id]).contacts
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
		send_mail(params)
		redirect_to root_path
	end

	def share_contacts
		users = users_to_share(params)
		if users != nil && params[:contacts] != nil
			contacts = contact_array(params)
			users.each do |user|
				user.contacts << contacts
			end
		else
			render :mes_contacts
		end
		redirect_to user_contacts_path
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :function, :phone, :email, :password)
	end
end