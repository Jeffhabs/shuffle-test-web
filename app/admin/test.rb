ActiveAdmin.register Test do
  menu priority: 1
  permit_params :name, :short_questions_count, :long_questions_count, category_ids: []

  index do
    selectable_column
    column :name
    actions
  end

  filter :name

  show do
    panel 'Questions' do
      table_for resource.questions do
        column(:text)     { |test| div test.text, class: 'avoid' }
        column(:provided) { |test| div test.provided, class: 'avoid' }
      end
    end
    active_admin_comments
  end

  sidebar 'Details', only: :show do
    attributes_table_for resource do
      row :id
      row :name
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'Test Details' do
      f.input :name
      if request.params[:action] == 'new' || request.params[:action] == 'create'
        f.input :category_ids, as: :select, collection: Category.all, multiple: true
        f.input :short_questions_count, as: :number
        f.input :long_questions_count, as: :number
      end
    end
    f.actions
  end
end
