module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"                                                    
        super :style => "text-align: Left;"                                     

        div do                                                                   
          small "Innova Powering What's Next #{Date.today.year}"                                       
        end
      end

    end
  end
end