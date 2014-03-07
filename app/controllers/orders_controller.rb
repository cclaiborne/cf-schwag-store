class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def checkout
    @order = Shoppe::Order.find(current_order.id)
    if request.patch?
      if @order.proceed_to_confirm(params[:order].permit(:first_name, :last_name, :billing_address1, :billing_address2, :billing_address3, :billing_address4, :billing_country_id, :billing_postcode, :email_address, :phone_number))
        redirect_to checkout_payment_path
      end
    end
  end

  def payment
    @order = current_order
    if request.post?
      if @order.accept_stripe_token(params[:stripe_token])
        redirect_to checkout_confirmation_path
      else
        flash.now[:notice] = "Could not exchange Stripe token. Please try again."
      end
    end
  end

  def confirmation
    if request.post?
      #Argh! I think this line is emailing from/to localhost?!
      #This is commented out for demo purposes!
      #current_order.confirm!
      session[:order_id] = nil
      redirect_to root_path, success: "Order has been placed successfully! Thank you!"
    end
  end

  def destroy
    current_order.destroy
    session[:order_id] = nil
    redirect_to root_path, success: "Cart emptied successfully."
  end

  def handle_unverified_request
    forgery_protection_strategy.new(self).handle_unverified_request
  end
end
