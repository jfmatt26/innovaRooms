ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :super_user

config.per_page = 10
config.sort_order = 'email_asc'

  index do
    if current_admin_user.super_user
      selectable_column
      id_column
    end
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    if current_admin_user.super_user
      actions
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :super_user
    end
    f.actions
  end

end
