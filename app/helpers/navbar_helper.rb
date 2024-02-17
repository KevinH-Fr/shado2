module NavbarHelper
    def title_nav(controller, action)
        if controller == 'pages' && action == 'index' 
            "Let's Shado!"
        elsif  controller == 'pages' && action == 'discover' 
            "Discover"
        end
    end 
end