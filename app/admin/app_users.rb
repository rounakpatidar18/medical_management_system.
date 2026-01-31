ActiveAdmin.register User, as: "AppUser" do
  permit_params :email, :role, :active

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :active
    column :created_at
    actions
  end

  filter :email
  filter :role
  filter :active
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :role,
              as: :select,
              collection: User.roles.keys - ["admin"]
      f.input :active
    end
    f.actions
  end
end
