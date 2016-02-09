module UsersHelper
  
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
      ContactMailer.mail_groupe(user, subject, message).deliver_now
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

  def qrcode
    url = url_for( :controller => 'contacts/registrations', :action => 'new' )
    RQRCode::QRCode.new(url).to_img.resize(200, 200).to_data_url
  end

  def users_to_share(params)
    params[:persons].map {|k, v|
      if v == "1"
        User.find(k.to_i)
      end
      }.compact
  end

  def contact_array(params)
    params[:contacts].map {|i| Contact.find(i.to_i)}
  end


end