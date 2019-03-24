ActiveAdmin.register Question do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :content, :reply, :reply_attributes
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
    actions
  end

  show do
    h3 question.title


    form do |f|
      # f.input 'Details' do
      #   # f.input :title
      #   # f.input :published_at, label: 'Publish Post At'
      # end
      f.input do
        f.input 'Content', :content
        # f.inputs do
        f.input :for => :replies do |a|
          # f.has_many :replies, heading: 'Themes', allow_destroy: true, new_record: true do |a|
          a.label 'Reply Content'
          a.input :content
        end
        # f.actions
      end

    end

    div do
      question.replies.each do |r|
        r.content
      end
    end
    # f.inputs do
    #   f.has_many :taggings, sortable: :position, sortable_start: 1 do |t|
    #     t.input :tag
    #   end
    # end
    # f.inputs do
    #   f.has_many :comment,
    #     new_record: 'Leave Comment',
    #   allow_destroy: -> (c) { c.author?(current_admin_user) } do |b|
    #     b.input :body
    #   end
    # end
    # f.action
  end

end
