ActiveAdmin.register Rooms do

#menu parent: "Locations"

#actions :all, :except => [:new]
config.per_page = 10
config.sort_order = 'name_asc'

#menu :locations => "Super Admin Only", :if => proc { current_admin_user.super_admin? }
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
permit_params :name, :description, :location_id, :capacity, :admin_user_id, {:equipment_assingment_ids => []}, equipment_ids: []


  # also look in to before_create if hidden on form
#  before_build do |record|
#    record.user = current_user
#  end

index do
    if current_admin_user.super_user
      selectable_column
    end
    column :name
      column :location_id,:searchable => true do |loc|
        loc = Locations.find(loc.location_id)
        link_to loc.name, admin_location_path(loc)
      end
      # column "Equipment" do |e|
      #   (e.equipment_rooms.map{ |p| p.name }).join(', ').html_safe
      # end
    column :capacity
    if current_admin_user.super_user
      column :admin_user
      actions
    else

    end

  end

  show do
    attributes_table do
      row :name
      row :description
      row :admin_user
      row :location_id,:searchable => true do |loc|
            loc = Locations.find(loc.location_id)
            link_to loc.name, admin_location_path(loc)
      end
      #row "Equipment" do |company|
       # (company.equipment_rooms.map{ |p| p.name }).join(', ').html_safe
      #end
      row :capacity
    end
     panel "Equipment" do
      #row :equipment_ids
        table_for rooms.equipment do
          #column :name
          column :equipment_id,:searchable => true do |e|
            #e = Equipment.find(e.equipment_id)
            link_to e.name, admin_equipment_path(e)
          end

          column :description
         end
     end
    active_admin_comments
  end

  # sidebar "Details", only: :show do
  #   attributes_table_for rooms do
  #     row :name
  #     row :capacity
  #     #row('Approved?') { |b| status_tag b.Approved? }
  #   end
  # end


filter :name, as: :string
filter :location, as: :select
filter :capacity, as: :select

form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Rooms" do
      f.input :name, :required => true
      f.input :capacity
      f.input :description
      f.input :location, :required => true, allow_blank: false
      f.input :admin_user_id, :as => :hidden, :input_html => {:value => current_admin_user.id}
    end


    f.inputs "Equipment" do
      f.input :equipment, :as => :check_boxes
     end
    f.actions
  end 


end
