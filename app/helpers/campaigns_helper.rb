module CampaignsHelper

  def campaign_public(campaign)
    content_tag(:div, id: dom_id(campaign), class: 'card m-2 p-2') do
      concat(content_tag(:p, content_tag(:strong, 'Title:') + campaign.title))
      concat(content_tag(:p, content_tag(:strong, 'Description:') + campaign.description))
      concat(content_tag(:p, content_tag(:strong, 'Subscription:') + campaign.subscription.to_s))
      concat(content_tag(:p, content_tag(:strong, 'Target:') + campaign.target.to_s))
      concat(content_tag(:p, content_tag(:strong, 'Start:') + campaign.start))
      concat(content_tag(:p, content_tag(:strong, 'End:') + campaign.end))

      #concat(content_tag(:p, content_tag(:strong, 'ref product stripe:') + campaign.stripe_product_id))
      #concat(content_tag(:p, content_tag(:strong, 'ref price stripe:') + campaign.stripe_price_id))
     # concat(content_tag(:p, content_tag(:strong, 'ref sub current fan:') + fan_user.subscriptions.find_by(campaign: campaign).stripe_subscription_id.to_s))

      if user_signed_in?  

        if subscribed_fan_to_campaign?(campaign, fan_user)
          concat(content_tag(:div, data: { turbo: false }) do
            form_with(url: :unsubscribe_session) do |f|
              concat(f.hidden_field(:id, value: campaign.id))
              concat(f.submit('Unsubscribe', class: 'btn btn-secondary w-100 fa fa-fade', style: 'font-family: Arial, sans-serif;'))
            end
          end)

        else
          concat(content_tag(:div, data: { turbo: false }) do
            form_with(url: :create_checkout_session) do |f|
              concat(f.hidden_field(:id, value: campaign.id))
              concat(f.submit('Subscribe', class: 'btn btn-success w-100 fa fa-fade', style: 'font-family: Arial, sans-serif;'))
            end
          end)

        end 
      else
        concat(content_tag(:p, 'you need to log in first'))
      end
    end
  end

  def campaign_badge(campaign)
    span_label = content_tag(:span, campaign.title)
  
    combined_content = content_tag(:div, class: "d-flex align-items-center") do
      concat(span_label)
    end 
  end

  def campaign_is_principale_title(principale)
    if principale == "true"
      "Main Campaign"
    else
      "Secondary Campaign"
    end

  end

end
