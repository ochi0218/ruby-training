class StoreController < ApplicationController
  skip_before_action :authorize

  def index
    if session[:counter].nil?
        session[:counter] = 0
    end

    session[:counter] += 1

    @products = Product.order(:title)
    @cart = current_cart
  end
end
