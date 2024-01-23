module CampaignsHelper

    def campaign_public(campaign)
        content_tag(:div, id: dom_id(campaign), class: 'card m-2 p-2') do
          concat(content_tag(:p, content_tag(:strong, 'Title:') + campaign.title))
          concat(content_tag(:p, content_tag(:strong, 'Description:') + campaign.description))
          concat(content_tag(:p, content_tag(:strong, 'Subscription:') + campaign.subscription.to_i))
          concat(content_tag(:p, content_tag(:strong, 'Target:') + campaign.target.to_i))
          concat(content_tag(:p, content_tag(:strong, 'Start:') + campaign.start))
          concat(content_tag(:p, content_tag(:strong, 'End:') + campaign.end))
    
          concat(content_tag(:div, data: { turbo: false }) do
            form_with(url: :create_checkout_session) do |f|
              concat(f.hidden_field(:id, value: campaign.id))
              concat(f.submit('Subscribe', class: 'btn btn-success w-100 fa fa-fade', style: 'font-family: Arial, sans-serif;'))
            end
          end)
        end
    end

end
