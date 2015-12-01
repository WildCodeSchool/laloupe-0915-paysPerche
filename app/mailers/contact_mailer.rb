class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_register.subject
  #
  def new_register(contact)
  	@contact = contact
    @greeting = "Hi"

    mail to: "#{@contact.email}", subject: "Vos accés à la plateforme du Pays Perche"
  end
end