class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_register.subject
  #
  def new_register(contact, password)
  	@contact = contact
    @greeting = "Hi"
    @password = password

    mail to: "#{@contact.email}", subject: "Confirmation de votre inscription"
  end

  def mail_groupe(contact, subject, body)
    @greeting = "Hello"
    @contact = contact
    @subject = subject
    @body = body
    @greeting = "Hi"

    mail to: "#{@contact.email}", subject: "#{@subject}"
  end
end
