module FansHelper
    def fan_user
        if current_user
            fan = Fan.where(user: current_user.id)
            if fan 
                fan.first
            end
        end
    end
end
