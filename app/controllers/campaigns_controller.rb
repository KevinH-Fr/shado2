class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[ show edit update destroy create_checkout_session ]

  # GET /campaigns or /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1 or /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end


  def create_checkout_session
    price = Stripe::Price.retrieve(@campaign.stripe_price_id)
    mode = price.recurring ? 'subscription' : 'payment'
  
    session = Stripe::Checkout::Session.create({
      metadata: {
        campaign_id: @campaign.id, 
      },
      customer_email: current_user.email,
      line_items: [
        {
          price: @campaign.stripe_price_id,
          quantity: 1,
        }
      ],
      mode: mode,
      success_url: root_url + "purchase_success?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:  campaign_url(@campaign),
    })
  
    redirect_to session.url, allow_other_host: true, status: 303
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
      params.require(:campaign).permit(:athlete_id, :title, :description, :periodicity, :recurrent, :subscription, :target, :start, :end, :thankyounote)
    end

    # a reprendre
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
          custom_unit_amount: { enabled: true },
        })
      end
    
      # Save the Stripe product and price IDs in the article
      campaign.update(stripe_product_id: product.id, stripe_price_id: price.id)
      
    end

end