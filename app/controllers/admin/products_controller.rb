class Admin::ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :edit, :create, :update, :destory]
  before_action :admin_required

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to admin_products_path, alert: "添加商品成功"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, alert: "编辑商品成功"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, alert: "删除商品成功"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end
end
