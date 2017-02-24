class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all.order("created_at ASC")
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
      @category = Category.find(params[:id])
      @categories = Category.all # needed for sidebar, probably better to use a cell for this
      respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

end
