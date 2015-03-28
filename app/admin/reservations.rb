ActiveAdmin.register Reservations do
  #menu :if => proc{ current_admin_user.can_edit_reservations? }
#menu label: "My Reservations"
# controller do
#    authorize_resource
#    include ActiveAdminCanCan
#  end


#navigation_menu do
 #   authorized?(:manage, SomeResource) ? :rooms : :restricted_menu
 # end
#navigation_menu :locations

scope :all_records
scope :approved
scope :unapproved
#scope "Tomorrow", :tomorrow


#actions :all, :except => [:new]
#config.per_page = 10
#config.sort_order = 'start_date_asc'
config.clear_sidebar_sections!
 
  # add this call - it will show only allowed action items
#  active_admin_allowed_action_items
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

permit_params :name, :description, :room_id, :approved, :start_date, :start_time, :end_time, :admin_user_id, {:equipment_assingment_ids => []}, equipment_ids: []


  # permit_params do
  #   params = [:name, :description, :room_id, :approved, :start_date, :start_time, :end_time, :admin_user_id, {:equipment_assingment_ids => []}, equipment_ids: []]
  #   params.push :author_id if current_user.admin?
  #   params
  # end
  index do
    # panel "Calendar" do
    #  # content do
    #    render partial: "calendar",:layout=>false
    #   #end
    # end
      #selectable_column
      column :name
      column :room_id,:searchable => true do |room|
              room = Rooms.find(room.room_id)
             link_to room.name, admin_room_path(room)
      end
      column :approved
      column :admin_user
      column :start_date
      column :start_time do |start|
        start.start_time.strftime('%H:%M:%p')
      end
      column :end_time do |e|
        e.end_time.strftime('%H:%M:%p')
      end
      actions
  end


  show do
    attributes_table do
      row :name
      row :description
      row :room_id,:searchable => true do |room|
            room = Rooms.find(room.room_id)
            link_to room.name, admin_room_path(room)
      end
      row :approved
      row :admin_user
      row :start_date
      row :start_time do |start|
        start.start_time.strftime('%H:%M:%p')
      end
      row :end_time do |e|
        e.end_time.strftime('%H:%M:%p')
      end

    end


    panel "Equipment" do
      
     end
   # if current_admin_user.super_user
   #   actions :all, :except => [:new]
      active_admin_comments
   # end

  end

#filter :name, as: :string
#filter :rooms, as: :select
#filter :capacity, as: :select

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Reservations" do
      f.input :room, include_blank: true, :required => true, allow_blank: false
      f.input :name, :required => true
      f.input :description, :required => true
      f.input :approved
      f.input :start_date, as: :datepicker, datepicker_options: { min_date: "+0d", max_date: "+1Y" }, :required => true, :hint => "Date must be today or later"
      f.input :start_time, :ampm => true, :start_hour => 9, :end_hour => 21, :include_blank => false, :as => :time_select , :minute_step => 15, :hint => "Start time must be before end time"#, :as => :time_picker, :input_html => {:step => :fifteen_minutes , :min => "07:00", :max => "21:00", :placeholder => "HH:MM"} 
      f.input :end_time, :ampm => true, :start_hour => 9, :end_hour => 22, :include_blank => false, :as => :time_select , :minute_step => 15#, :as => :time_picker, :input_html => {:step => :fifteen_minutes , :min => "07:00", :max => "21:00", :placeholder => "HH:MM"} 
      f.input :admin_user_id, :as => :hidden, :input_html => {:value => current_admin_user.id}
      # f.input :ends_at,   as: :datepicker, datepicker_options: { min_date: 3.days.ago.to_date, max_date: "+1W +5D" }
      f.actions
    end
  end


end
