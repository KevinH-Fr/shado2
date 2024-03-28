class CampaignsController < ApplicationController

  include FansHelper

  before_action :set_campaign, only: %i[ show edit update destroy create_checkout_session unsubscribe_session ]

  def index
    @campaigns = Campaign.all
  end

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def edit
  end


  def create_checkout_session

    price = Stripe::Price.retrieve(@campaign.stripe_price_id)
    mode = price.recurring ? 'subscription' : 'payment'
  
    if mode == 'payment'

      # selection prix boutons ou textbox custom
      if params[:selected_price].present? 
        final_price = params[:selected_price].to_i * 100
      else 
        final_price = params[:custom_price].to_i * 100
      end
    
      line_items = [
        {
          price_data: {
            currency: 'eur',
            product_data: {
              name: @campaign.title,
              metadata: {
                product_id: @campaign.id # Add product identifier as metadata
              }
            },
            unit_amount: final_price,
          },
          quantity: 1
        }
      ]
    
    else
      line_items = [
        {
          price: @campaign.stripe_price_id,
          quantity: 1,
        }
      ]
    end
  
    session = Stripe::Checkout::Session.create(
      {
        metadata: {
          campaign_id: @campaign.id
        },
        customer_email: current_user.email,
        line_items: line_items,
        mode: mode,
        success_url: root_url + "purchase_success?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: campaign_url(@campaign),
      }
    )
  
    redirect_to session.url, allow_other_host: true, status: 303
  end
  

  
  def unsubscribe_session

    subscription_id = fan_user.subscriptions.find_by(campaign: @campaign, status: "paid").stripe_subscription_id 
        
    begin
      stripe_subscription = Stripe::Subscription.retrieve(subscription_id)
      stripe_subscription.cancel
      flash[:notice] = "Subscription canceled successfully."

      subscription = Subscription.find_by(stripe_subscription_id: subscription_id)
      
      if subscription.present?
        subscription.update(status: "cancelled")
      else
        flash[:alert] = "Error updating subscription status: Subscription not found in the database."
      end

    rescue Stripe::StripeError => e
      flash[:alert] = "Error canceling subscription: #{e.message}"
    end
    redirect_to root_path # Adjust the redirection path as needed

  end



  # POST /campaigns or /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)


    respond_to do |format|
      if @campaign.save

        create_stripe_product_and_price(@campaign)

        format.html { redirect_to campaign_url(@campaign), notice: "Campaign was successfully created." }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1 or /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to campaign_url(@campaign), notice: "Campaign was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1 or /campaigns/1.json
  def destroy
    @campaign.destroy!

    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: "Campaign was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
      params.require(:campaign).permit(:athlete_id, :title, :description, :periodicity, :recurrent, :subscription, 
        :target, :start, :end, :thankyounote, :panorama_pic, :principale)
    end

    def create_stripe_product_and_price(campaign)
      # Create a product in Stripe
      product = Stripe::Product.create(name: campaign.title, description: campaign.description)
    
      if campaign.recurrent
        # Subscription case
        price = Stripe::Price.create({
          product: product.id,
          unit_amount: (campaign.subscription.to_i * 100).to_i,  # Convert to cents
          currency: 'eur',
          recurring: { interval: 'month' },  # Adjust based on your subscription model
        })
      else
        # One-time payment case
        price = Stripe::Price.create({
          product: product.id,
          currency: 'eur',
          custom_unit_amount: {
            enabled: true
          },
        })
      end
    
      # Save the Stripe product and price IDs in the campaign
      campaign.update(stripe_product_id: product.id, stripe_price_id: price.id)
      
    end

end
