class Confirmation < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation.new_confirm.subject
  #
  def new_confirm
  	@greeting = "Bonjour"
    @contact = Contact.last
    @email = @contact.email

    mail to: "#{@email}", subject: "Vos accés à la plateforme du Pays Perche"
  end
end
