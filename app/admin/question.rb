ActiveAdmin.register Question do
  menu priority: 2
  permit_params :category_id, :question_type, :text, :provided, :provided_language

  index do
    selectable_column
    id_column
    column :category
    column :question_type
    column :text
    column :provided_language
    column :provided
    actions
  end

  filter :category_id
  filter :question_type
  filter :text
  filter :provided_language
  filter :provided

  form do |_f|
    render partial: 'form'
  end
end
