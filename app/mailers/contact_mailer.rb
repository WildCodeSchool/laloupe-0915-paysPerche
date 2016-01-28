class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_register.subject
  #
  def new_register(contact, password)
    @contact = contact
    @user = User.find_by(contact.user_id)
    @greeting = "Hi"
    @password = password

    mail to: "#{@contact.email}", subject: "Confirmation de votre inscription | Perche 2.8"
  end

  def mail_groupe(contact, subject, body)
    @greeting = "Hello"
    @contact = contact
    @subject = subject
    @body = body
    @greeting = "Hi"

    mail to: "#{@contact.email}", subject: "#{@subject} | Perche 2.8"
  end
end
