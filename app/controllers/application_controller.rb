class ApplicationController < ActionController::Base
    include Pagy::Backend

    before_action :set_notifications, if: :current_user 

    private

    #        notifications = Notification.where(recipient: current_user).newest_first.limit(9)
    def set_notifications
        notifications = Notification.all

        @unread = notifications.unread
        @read = notifications.read
    end

end
