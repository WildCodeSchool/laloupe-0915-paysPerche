class ContactsController < ApplicationController

	def index
		@contact = Contact.all
	end

	def show
		@contact = current_contact
	end

	def new
		
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		if @contact.update(contact_params)
				redirect_to root_path, notice: "\#{@contact.first_name}\" a été modifié avec succés"
		else
			render 'edit', notice: "\#{@contact.first_name}\" n'a pas été modifié"
		end
	end

	private
	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :function, :phone, :email, :password, :note, :id_user)
	end
end
