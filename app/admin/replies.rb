ActiveAdmin.register Reply do
  includes :question
  belongs_to :question
  permit_params :content, :user, :question, :user_type, :user_id

  index do
    column :user_type
    column :content
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :user_id, as: :hidden, :input_html => { value: current_admin_user.id }
      f.input :user_type, as: :hidden, :input_html => { value: 'AdminUser' }
      f.input :content
    end
    f.actions
  end

end
