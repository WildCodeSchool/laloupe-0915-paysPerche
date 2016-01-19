class ContactsController < ApplicationController

	def index
		@contact = Contact.all
	end

	def show
		@contact = current_contact
	end

	def new
		o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		@mdp = (0...8).map { o[rand(o.length)] }.join
		@contact = Contact.new
	end

	def edit
		@contact = Contact.find(params[:id])
	end
	
	def create
		@contact = current_user.contacts.build(contact_params)
		if @contact.save
			redirect_to root_path
		else
			render 'new'
		end
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
		params.require(:contact).permit(:first_name, :last_name, :function, :phone, :email, :password, :note, :user_id, :organisation)
	end
end
