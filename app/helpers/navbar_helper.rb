module NavbarHelper
    def title_nav(controller, action)
        if controller == 'pages' && action == 'index' 
            "Let's Shado!"
        elsif  controller == 'pages' && action == 'discover' 
            "Discover"
        elsif  controller == 'dashboard_athlete' 
            "Dashboard"
        end
    end 
end