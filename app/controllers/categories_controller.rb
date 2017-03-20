class CategoriesController < ApplicationController

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

end
