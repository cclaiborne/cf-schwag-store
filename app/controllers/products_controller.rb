class ProductsController < ApplicationController
  def index
    @products = Shoppe::Product.root.ordered.includes(:product_category, :variants)
    @products = @products.group_by(&:product_category)
  end

  def show
    @product = Shoppe::Product.find_by_permalink(params[:permalink])
<<<<<<< HEAD
    #binding.pry
=======
    # binding.pry
>>>>>>> 1bb11d112c39ab375040d783e8b5e366a1428ecf
  end

  def buy
    @product = Shoppe::Product.find_by_permalink!(params[:permalink])
    current_order.order_items.add_item(@product, 1)
    redirect_to product_path(@product.permalink), :notice => "Product has been added successfuly!"
  end
end
