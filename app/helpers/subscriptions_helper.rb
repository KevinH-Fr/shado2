module SubscriptionsHelper
    def subscribed_fan?(athlete, fan)
        # Check if the fan has a subscription for any campaign belonging to the specified athlete
        Subscription.joins(campaign: :athlete).exists?(athletes: { id: athlete.id }, fan_id: fan.id)
    end
end
