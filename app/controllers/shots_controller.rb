class ShotsController < ApplicationController

	before_action :find_shot, only: [:show, :edit, :update, :destroy]

	def index
		@shots = Shot.order("created_at DESC")
	end

	def new
		@shot = Shot.new
	end

	def create
		@shot = Shot.new(shot_params)
		if @shot.save
			redirect_to shots_path, notice: "Shot 已建立。"
		else
			render :new, alert: "Shot 建立失敗。"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @shot.update(shot_params)
			redirect_to shots_path, notice: "Shot 已修改。"
		else
			render :edit, alert: "Shot 修改失敗。"
		end
	end

	def destroy
		@shot.destroy
		redirect_to shots_path, alert: "Shot 已刪除!"
	end

	private

	def shot_params
		params.require(:shot).permit(:title, :description, :link)
	end

	def find_shot
		@shot = Shot.find(params[:id])
	end

end
