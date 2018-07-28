class UsersController < ApplicationController

	before_action :find_user, only: [:show, :edit, :update]

	def show
	end

	def edit
		unless @user == current_user
			redirect_to user_path(@user)
		end
	end

	def update
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	private

	def find_user
		@user = User.find_by(id: params[:id])
		if @user.blank?
			redirect_to root_path
		end
	end

	def user_params
		params.require(:user).permit(:name, :intro)
	end

end
