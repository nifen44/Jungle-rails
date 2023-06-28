class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.all.size
    @category_count = Category.all.size
  end
end
