class StripeController < ApplicationController
  def purchase_success
    session = Stripe::Checkout::Session.retrieve(params[:session_id])

    if session.payment_status == 'paid'
      campaign_id = session.metadata.campaign_id
      @campaign = Campaign.find(campaign_id)


      product_id = @campaign.stripe_product_id
      #subscription_id = @campaign.recurrent ? @campaign.stripe_price_id : nil

      subscription_id =  session.subscription 

      puts "_______________test sub id #{subscription_id}_______________________________"


      Subscription.find_or_create_by(
        fan: Fan.where(user: current_user.id).first, 
        campaign: @campaign, 
        stripe_product_id: product_id,
        stripe_subscription_id: subscription_id,
         
        ) do |subscription|
          subscription.status = 'paid'
      end

    end

  end
end
