module UsersHelper
	def is_admin
		@user = current_user
		if @user.is_admin == true
			redirect_to rails_admin_path
		end
	end
  
  def group_to_send(params)
    tab_users = []
    params[:person].each do |k, v|
      if !!k.match(/^.+@.+$/) && v.include?("1")  
        tab_users <<Contact.where(email: k)
      end  
    end
    tab_users
  end

  def send_mail(params)
    users = group_to_send(params).flatten!
    message = message_to_send(params)
    subject = email_subject(params)

    users.map do |user|
      ContactMailer.mail_groupe(user, subject, message).deliver_later!
    end
  end

  def message_to_send(params)
    message = ""
    params[:person].each do |k, v|
      if k == "body"
        message = v
      end
    end
    message
  end

  def email_subject(params)
    subject = ""
    params[:person].each do |k, v|
      if k == "subject"
        subject = v
      end
    end
    subject
  end

  def contacts_to_share(params)
    tab_contacts = []
    params[:person].each do |k, v|
      if v.include?("1")
        tab_contacts << Contact.where(id: k)
      end  
    end
    tab_contacts
  end

  def users_to_share(params)
    tab_users = []
    params[:person2].each do |k, v|
      if v.include?("1")  
        tab_users << Contact.where(id: k)
      end  
    end
    tab_users
  end

  def relations(params)
    contacts = contacts_to_share(params).flatten!
    users = users_to_share(params).flatten!
    users.find_each do |user|
      user.contacts << contacts
    end
  end

  def qrcode
    url = url_for( :controller => 'contacts/registrations', :action => 'new' )
    RQRCode::QRCode.new(url).to_img.resize(200, 200).to_data_url
  end

end
