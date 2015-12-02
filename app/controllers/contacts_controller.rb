class ContactsController < ApplicationController

	def index
		@contact = Contact.all
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		@string = (0...8).map { o[rand(o.length)] }.join
		@user = User.find(params[:id])
		@contact = Contact.new
		@qr = RQRCode::QRCode.new(request.original_url).to_img.resize(200, 200).to_data_url
	end

	def edit
		@contact = Contact.find(params[:id])
	end
	def create
		@contact = Contact.new(contact_params, :password => '#{@string}')
		if @contact.save
			ContactMailer.deliver_new_register(@contact)
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
		params.require(:contact).permit(:first_name, :last_name, :function, :phone, :email, :password, :note)
	end
end
