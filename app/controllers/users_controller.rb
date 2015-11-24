class UsersController < ApplicationController

	def index
		@user = User.all
	end

	def show
		@user = current_user
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
				redirect_to root_path, notice: "\#{@user.first_name}\" a été modifié avec succés"
		else
			render 'edit', notice: "\#{@user.first_name}\" n'a pas été modifié"
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :function, :phone, :email, :password)
	end
end


