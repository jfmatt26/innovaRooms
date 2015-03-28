ActiveAdmin.register_page "Dashboard" do

menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }


   content title: proc{ I18n.t("active_admin.dashboard") } do
     div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #    end
     end



section "Unapproved Reservations" do
    table_for Reservations.where(approved: 'false') do
        column :name do |r|
            link_to r.name, [:admin, r] #Could use admin_resorvation_path(r)
        end
        column :room_id do |room|
            room = Rooms.find(room.room_id)
            link_to room.name, admin_room_path(room)
        end
        column :approved
        column :start_date
        column :start_time do |start|
          start.start_time.strftime('%H:%M:%p')
        end
        column :end_time do |e|
          e.end_time.strftime('%H:%M:%p')
        end
    end
     strong {link_to "View All Products", admin_reservations_path }
end



section "Recent Reservations" do
     table_for Reservations.order("start_date asc", "start_time asc").limit(10) do
        column :name do |r|
            link_to r.name, [:admin, r] #Could use admin_resorvation_path(r)
        end
        column :room_id do |room|
            room = Rooms.find(room.room_id)
            link_to room.name, admin_room_path(room)
        end
        column :approved
        column :start_date
        column :start_time do |start|
          start.start_time.strftime('%H:%M:%p')
        end
        column :end_time do |e|
          e.end_time.strftime('%H:%M:%p')
        end
     end
     strong {link_to "View All Products", admin_reservations_path }
end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
