class Admin::CategoriesController < ApplicationController
  layout 'dashboard'
  before_filter :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_admin


  def index
    @categories = Category.all.order("created_at ASC")
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all # needed for sidebar, probably better to use a cell for this
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title, :image)
    end

    def require_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end
end