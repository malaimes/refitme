class Admin::PostsController < ApplicationController
  layout 'dashboard'
  before_filter :authenticate_user!
  before_action :require_admin


  def index
    @posts = Post.all.order("created_at DESC")

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end