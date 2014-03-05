class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_order
    @current_order ||=  begin
      if has_order?
        @current_order
      else
        order =
        session[:order_id] =
        order
      end
    end
  end

  def has_order?
    !!(
      session[:order_id] &&
      @current_order = Shoppe::Order.includes(:order_items => :ordered_items).find_by_id(session[:order_id])
    )
  end

  helper_method :current_order, :has_order?
end
