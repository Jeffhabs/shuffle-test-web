ActiveAdmin.register Category do
  menu priority: 3
  permit_params :title

  index do
    selectable_column
    column :title
    column :created_at
    actions
  end

  filter :title
  filter :created_at

  form do |f|
    f.inputs 'Category Details' do
      f.input :title
    end
    f.actions
  end
end
