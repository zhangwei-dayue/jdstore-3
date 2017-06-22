class CartsController < ApplicationController
  def clean
    current_cart.clean!
    redirect_to carts_path, alert: "清空商品成功"
  end
end
