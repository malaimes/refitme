class Admin::TypesController < ApplicationController
  layout 'dashboard'
  before_filter :authenticate_user!
  before_action :set_type, only: [:show, :edit, :update, :destroy]
  before_action :require_admin


  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /categories/new
  def new
    @type = Type.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @type = Type.new(type_params)
    respond_to do |format|
      if @type.save
        format.html { redirect_to admin_types_url, notice: 'Добавлен новый тип девайсов.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @type.update(type_params)
        format.html { redirect_to admin_types_url, notice: 'Изменен тип девайсов.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @type.destroy
    respond_to do |format|
      format.html { redirect_to admin_types_url, notice: 'Девайсы и связанные услуги удалены.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_params
      params.require(:type).permit(:title)
    end

    def require_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end
end