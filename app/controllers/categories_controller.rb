class CategoriesController < ApplicationController

  # GET /categories
  # GET /categories.json
  respond_to :html
  respond_to :js, only: :show
  def index
    @categories = Category.all.order("created_at ASC")
  end

  def show
    @category = Category.friendly.find(params[:id])
    respond_with_category_or_redirect
  end

  private

    def respond_with_category_or_redirect
      # If an old id or a numeric id was used to find the record, then
      # the request path will not match the post_path, and we should do
      # a 301 redirect that uses the current friendly id.
      if request.path != category_path(@category)
        return redirect_to @category, status: :moved_permanently
      else
        return respond_with @category
      end
    end
  
end