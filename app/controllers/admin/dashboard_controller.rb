class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    @total_product = Product.count
    @total_category = Category.count
    @total_order = Order.count
  end
end
