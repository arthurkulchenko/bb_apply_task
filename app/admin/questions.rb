ActiveAdmin.register Question do
  menu false

  actions :all, :except => [:destroy, :edit]
  config.batch_actions = false

  index do
    id_column
    column :title
    column :content
    column do |a|
      link_to 'Replies', admin_question_path(a)
    end
  end

  show do
    panel "User with a email - #{question.plain_user.email} ask:" do
      h3 "Question: #{question.content}"
    end
    panel "Replies" do

      table_for question.replies do
        column(:admin) { |reply| reply.content if reply.user_type == 'AdminUser' }
        column(:user)  { |reply| reply.content if reply.user_type == 'PlainUser'  }
      end

    end
    a link_to 'reply', new_admin_question_reply_path(question)

  end
end
