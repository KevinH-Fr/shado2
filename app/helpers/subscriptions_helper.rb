module SubscriptionsHelper
    def subscribed_fan_to_athlete?(athlete, fan)
        # Check if the fan has a subscription for any campaign belonging to the specified athlete
        Subscription.joins(campaign: :athlete).exists?(athletes: { id: athlete.id }, fan_id: fan.id)
    end

    def subscribed_fan_to_campaign?(campaign, fan)
        # Check if the fan has a subscription for a specific campaign
        Subscription.joins(:campaign).exists?(campaigns: { id: campaign.id }, fan_id: fan.id, status: "paid")
      end
      
end
