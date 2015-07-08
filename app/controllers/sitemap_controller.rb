class SitemapController < ApplicationController
	def show
		@posts = Post.all
		@categories = Category.all
	end
end
