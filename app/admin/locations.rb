ActiveAdmin.register Locations do

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
permit_params :name, :description, :address_l1, :address_l2, :city, :state,:admin_user_id, :zipcode, :phone_number

  index do
    if current_admin_user.super_user
      selectable_column
    end
    column :name
    column "Address", :address_l1
    column :city
    column :state
    column :zipcode
    if current_admin_user.super_user
      column :admin_user
      actions
    end
  end

 show do
    attributes_table do
      row :name
      row :description
      row "Address Line 1", :address_l1
      row "Address Line 2", :address_l2
      row :city
      row :state
      row :zipcode
      row :phone_number
      row :admin_user
    end
    # panel "Table of Contents" do
    #   # table_for book.chapters do
    #   #   column :number
    #   #   column :title
    #   #   column :page
    #   # end
    # end
    if current_admin_user.super_user
      active_admin_comments
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Locations" do
      f.input :name
      f.input :description
      f.input :address_l1, label: "Address Line 1"
      f.input :address_l2, label: "Address Line 2"
      f.input :city
      f.input :state
      f.input :zipcode
      f.input :phone_number
      f.input :admin_user_id, :as => :hidden, :input_html => {:value => current_admin_user.id}
    end
    f.actions
  end 

filter :name, as: :string
filter :address_l1, as: :string, label: "Address"
filter :city, as: :select
filter :state, as: :select
filter :zipcode, as: :string



end

