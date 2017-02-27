class PostsController < ApplicationController
	before_action :find_post, only: [:show, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]


	def index
		@posts = Post.all.order("created_at DESC").page(params[:page]).per(9)
	end

	def show
		@comments = Comment.where(post_id: @post)
		@random_post = Post.where.not(id: @post).order("RANDOM()").first
	end

	def upvote
		@post.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@post.downvote_from current_user
		redirect_to :back
	end

	private

	def find_post
		@post = Post.friendly.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :link, :description, :image)
	end
end