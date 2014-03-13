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
    @total_before_tax = @order.total_before_tax * 100

    if request.post?
      Stripe.api_key = ENV["SECRET_KEY"]

      # Get the credit card details submitted by the form
      token = params[:stripeToken]
      STDERR.puts "       **token: #{token}**"

      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        charge = Stripe::Charge.create(
          :amount => 500,
          :currency => "usd",
          :card => token,
          :description => "payinguser@example.com"
        )
      rescue Stripe::CardError => e
        # The card has been declined
        flash.now[:notice] = e
      end
      STDERR.puts "        **charge: #{charge}**"
      STDERR.puts "        **params: #{params}**"

      redirect_to checkout_confirmation_path, success: "Your credit card details were saved!"
    end
  end

  def confirmation
    if request.post?
      current_order.confirm!
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
