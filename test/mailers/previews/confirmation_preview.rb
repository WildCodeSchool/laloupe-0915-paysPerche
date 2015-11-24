# Preview all emails at http://localhost:3000/rails/mailers/confirmation
class ConfirmationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirmation/new_confirm
  def new_confirm
    Confirmation.new_confirm
  end

end
