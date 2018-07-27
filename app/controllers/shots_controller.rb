class ShotsController < ApplicationController

	before_action :find_shot, only: [:show, :edit, :update, :destroy, :like, :unlike]
	before_action :authenticate_user!, except: [:index, :show]
	impressionist actions: [:show], unique: [:impressionable_type, :impressionable_id, :session_hash]

	def index
		@shots = Shot.order("created_at DESC")
		@jumbotron = true
	end

	def new
		@shot = current_user.shots.build
	end

	def create
		@shot = current_user.shots.build(shot_params)
		if @shot.save
			redirect_to shots_path, notice: "Shot 已建立。"
		else
			render :new, alert: "Shot 建立失敗。"
		end
	end

	def show
		@comment = Comment.new
	end

	def edit
	end

	def update
		if @shot.update(shot_params)
			redirect_to shot_path(@shot), notice: "Shot 已修改。"
		else
			render :edit, alert: "Shot 修改失敗。"
		end
	end

	def destroy
		@shot.destroy
		redirect_to shots_path, alert: "Shot 已刪除!"
	end

	def like
		@shot.liked_by current_user
		respond_to do |format|
			format.html { redirect_back fallback_location: root_path}
		end
	end

	def unlike
		@shot.unliked_by current_user
		respond_to do |format|
			format.html { redirect_back fallback_location: root_path}
		end
	end

	private

	def shot_params
		params.require(:shot).permit(:title, :description, :link, :image)
	end

	def find_shot
		@shot = Shot.find_by(id: params[:id])
		if @shot.blank?
			redirect_to root_path
		end
	end

end
