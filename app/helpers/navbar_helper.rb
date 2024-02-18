module NavbarHelper
    def title_nav(controller, action)
        if controller == 'pages' && action == 'index' 
            "Let's Shado!"
        elsif  controller == 'pages' && action == 'discover' 
            "Discover"
        elsif  controller == 'dashboard_athlete' 
            "Dashboard"
        elsif  controller == 'messages' 
            "Chat"
        end
    end 
end