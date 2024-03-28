module ButtonsSubscribeHelper
    def subscription_button(athlete, fan_user)
        campaign = athlete.campaigns.where(principale: true).first
    
        if campaign.present?
          if subscribed_fan_to_campaign?(campaign, fan_user)
            unsubscribe_button(athlete)
          else
            subscribe_button(athlete)
          end
        end
    end

    def subscribe_button(athlete)
        link_to create_checkout_session_path(id: athlete.campaigns.where(principale: true).first.id), method: :post, class: "btn w-100 orange-bg-colored text-light fw-bold", "data-turbo" => "false" do
            concat content_tag(:i, nil, class: "fa-solid fa-plus mx-1")
            concat content_tag(:span, "Subscribe", class: "fw-bold")
        end
    end

    def unsubscribe_button(athlete)
        link_to unsubscribe_session_path(id: athlete.campaigns.where(principale: true).first.id), method: :post, class: "btn w-100 bg-secondary text-light fw-bold", "data-turbo" => "false" do
            concat content_tag(:i, nil, class: "fa-solid fa-plus mx-1")
            concat content_tag(:span, "Unsubscribe", class: "fw-bold")
        end
    end
    

end
  