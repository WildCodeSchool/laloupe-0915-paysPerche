module ApplicationHelper
  def is_admin
    @user = current_user
    if @user.is_admin == true
      redirect_to rails_admin_path
    else
      redirect_to root_path, alert: "Vous n'avez pas les autorisations requises pour effectuer cette action"
    end
  end
end
