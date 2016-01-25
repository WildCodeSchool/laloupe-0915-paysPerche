require Rails.root.join('lib', 'rails_admin_publish.rb')
#include ApplicationHelper
RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.is_admin==true
  end
  ### Popular gems integration


  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
end