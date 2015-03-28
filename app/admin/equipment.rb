ActiveAdmin.register Equipment do

config.per_page = 10
config.sort_order = 'name_asc'

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
permit_params :name, :description,:admin_user_id#, equipment_id: [], rooms_id: []


filter :name, as: :string


index do
    if current_admin_user.super_user
      selectable_column
    end
    column :name
    column :description
    if current_admin_user.super_user
      column :admin_user
    end
      #column "Rooms" do |e|
      #  (e.equipment_rooms.map{ |p| p.name }).join(', ').html_safe
      #end
      if current_admin_user.super_user
        actions
      end
  end

show do
    attributes_table do
      row :name
      row :description
      row :admin_user
      #row "Equipment" do |company|
      #  (company.equipment_rooms.map{ |p| p.name }).join(', ').html_safe
     # end
    end
    # panel "Equipment" do
    #    table_for equipment_rooms do
    #      column :equipment_id
    #   #   column :title
    #   #   column :page
    #     end
    # end
    if current_admin_user.super_user
      active_admin_comments
    end
  end

 form do |f|
     f.semantic_errors *f.object.errors.keys
     f.inputs "Equipment" do
       f.input :name
       f.input :description
       f.input :admin_user_id, :as => :hidden, :input_html => {:value => current_admin_user.id}
     end 
#     f.inputs "Rooms" do
#       f.has_many :equipment_rooms do |deg|
#         deg.input :rooms
#       end
#     end
     f.actions
   end 

end
