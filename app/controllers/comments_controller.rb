class CommentsController < ApplicationController
	
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :find_comment, only: [:create, :destroy]

	def create
		@comment = @shot.comments.build(comment_params) # creates the comment on the shot passing in params
		@comment.user_id = current_user.id if current_user # assigns logged in user's ID to comment
		@comment.save!
		redirect_to shot_path(@shot)
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to shot_path(@shot)
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def find_comment
		@shot = Shot.find(params[:shot_id]) # finds the shot with the associated shot_id
	end

end
