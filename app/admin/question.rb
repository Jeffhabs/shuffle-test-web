ActiveAdmin.register Question do
  menu priority: 2
  permit_params :category_id, :question_type, :text, :provided, :provided_language

  controller do
    def scoped_collection
      super.includes :category
    end
  end

  index do
    selectable_column
    column :category, sortable: 'categories.title'
    column :question_type
    column :text
    column :provided_language
    column :provided
    actions
  end

  filter :category
  filter :question_type
  filter :text
  filter :provided_language
  filter :provided

  action_item :new, only: :show, priority: 1 do
    link_to 'New Question', new_admin_question_path
  end

  form do |_f|
    render partial: 'form'
  end
end
