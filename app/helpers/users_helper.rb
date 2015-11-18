module UsersHelper
	def is_admin
		@user = current_user
		if @user.is_admin == true
			redirect_to rails_admin_path
		end
		
	end
end
