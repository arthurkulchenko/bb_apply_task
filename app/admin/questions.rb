ActiveAdmin.register Question do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :content, :reply, replies_attributes: [:id, :content, :user_type, :user_id, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    id_column
    column :title
    column :content
    column do |a|
      link_to a, admin_question_replies_path(a)
    end
    # column "plain_user" do |q|
    # link_to "#{q.plain_user.title}@#{q.plain_user.email}", admin_plain_user_path
    # end
    # column "Детали" do |resource|
    #   link_to "Просмотр", admin_poll_question_path(resource.poll_id, resource)
    # end
    actions
  end

  form do |f|
    # f.input 'Details' do
    #   # f.input :title
    #   # f.input :published_at, label: 'Publish Post At'
    # end
    f.inputs do
      f.input :content
      f.semantic_errors *f.object.errors.keys
      # f.input do
      #   # f.input :for => :replies do |a|
      f.has_many :replies, allow_destroy: true, new_record: true do |a|
        a.label 'Reply Content'
        a.input :content
      end
    end
    f.semantic_errors
    f.actions
  end


  show do
    h3 "User with a email: #{question.plain_user.email} ask:"
    h3 "Question: #{question.content}"
    h3 'Next his replies'
    div do
      question.replies.each do |r|
        h4 "- #{r.content} - from #{r.user.id}@#{r.user_type}"
      end
    end

    # form do |f|
    #   f.input do
    #     f.has_many :replies do |t|
    #       t.input :content
    #     end
    #     f.action
    #   end
    # end
    form do |f|
      # f.input :content
      # end
      # f.inputs do
      #   f.has_many :comment,
      #     new_record: 'Leave Comment',
      #   allow_destroy: -> (c) { c.author?(current_admin_user) } do |b|
      #     b.input :body
      # end
    end
    # f.action
  end
end
