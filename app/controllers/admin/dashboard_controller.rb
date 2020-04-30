class Admin::DashboardController < ApplicationController
 
  before_filter :authenticate
  
  def show
    @products = Product
    @categories = Category
  end
end
