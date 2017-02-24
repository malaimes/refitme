class Admin::UnitsController < ApplicationController 
  layout 'dashboard'
  before_filter :authenticate_user!
  before_action :require_admin


  def new
    @category = Category.find(params[:category_id])
    @unit = @category.units.new
  end


  def create
    @category = Category.find(params[:category_id])
    @unit = @category.units.create(unit_params)
    redirect_to admin_category_url(@category)
  end

  def edit
    @category = Category.find(params[:category_id])
    @unit = @category.units.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @unit = @category.units.find(params[:id])
    if @unit.update_attributes(unit_params)
      redirect_to admin_category_url(@category)
    else
      flash[:error] = "That todo item could not be saved."
      render action: :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @unit = @category.units.find(params[:id])
    if @unit.destroy
      flash[:success] = "Todo list item was deleted."
    else
      flash[:error] = "Todo list item could not be deleted."
    end
    redirect_to admin_category_url(@category)
  end


  private
    def unit_params
      params.require(:unit).permit( :title, :price, :tooltip )
    end

    def require_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end
end

