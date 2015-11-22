ActiveAdmin.register Test do
  menu priority: 1
  permit_params :name, :short_questions_count, :long_questions_count

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  show do
    panel 'Questions' do
      table_for resource.questions do
        column :text
        column :provided
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
      if request.params[:action] == 'new'
        f.input :category_ids, as: :select, collection: Category.all, multiple: true, if: proc { action == 'create' }
        f.input :short_questions_count, as: :number, if: proc { action == 'create' }
        f.input :long_questions_count, as: :number, if: proc { action == 'create' }
      end
    end
    f.actions
  end
end
