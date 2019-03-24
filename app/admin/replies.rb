ActiveAdmin.register Reply do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  includes :question
  belongs_to :question
  permit_params :content, :user, :question
  #
  # or
  # controller do
  #   def new
  #     # Good
  #     current_user
  #     # Bad
  #     @post = Post.new(params[:post])

  #     if @post.save
  #       # ...
  #     end
  #   end
  # end
  #
  index do
    column :user_type
    column :content

    # column "Детали" do |resource|
    #   link_to "Просмотр", admin_poll_question_path(resource.poll_id, resource)
    # end
  end
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    # f.input 'Details' do
    #   # f.input :title
    #   # f.input :published_at, label: 'Publish Post At'
    # end
    f.inputs do
      f.input  :user, default: current_user
      # f.select :question, Question.all
      f.input :content
      # f.input do
      #   # f.input :for => :replies do |a|
      # f.has_many :replies, heading: 'Themes', allow_destroy: true, new_record: true do |a|
      #   a.label 'Reply Content'
      #   a.input :content
      # end
    end
    f.actions
  end

end
