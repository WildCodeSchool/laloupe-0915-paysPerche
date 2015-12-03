require Rails.root.join('lib', 'rails_admin_publish.rb')
RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to root_path unless current_user.is_admin == true
  end
  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  # config.actions do
  #   dashboard                     # mandatory
  #   index                         # mandatory
  #   new
  #   export
  #   bulk_delete
  #   show
  #   edit
  #   delete
  #   show_in_app

  #   ## With an audit adapter, you can add:
  #   # history_index
  #   # history_show
  # end

  # Register the class in lib/rails_admin_publish.rb
module RailsAdmin
  module Config
    module Actions
      class Publish < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
      end
    end
  end
end
 
config.actions do
  # root actions
  dashboard                     # mandatory
  # collection actions
  index                         # mandatory
  new
  export
  history_index
  bulk_delete
  # member actions
  show
  edit
  delete
  history_show
  show_in_app
 
  # Set the custom action here
  publish do
    # Make it visible only for article model. You can remove this if you don't need.
    visible do
      bindings[:abstract_model].model.to_s == "Article"
    end
  end
end
end
