module UsersHelper
	def is_admin
		@user = current_user.find(:id)
		if @user.is_admin == true
			redirect_to :rails_admin
		end
		
	end
end
