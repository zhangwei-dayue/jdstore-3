class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.order("id DESC")
  end
end
