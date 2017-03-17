class Admin::PostsController < ApplicationController
  layout 'dashboard'
  before_filter :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :require_admin


  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @comments = Comment.where(post_id: @post)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_url, notice: 'Добавлен новый пост.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_posts_url, notice: 'Пост отредактирован.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def find_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :link, :description, :image, :seo_title, :seo_keywords, :seo_description)
    end

    def require_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end
end