ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div do
      b"Unreplied questions: #{Question.where(admin_user_id: nil).count}"
      hr
    end
    table_for Question.all do
      column(:question_title) { |question| question.title.titleize }
      column(:link) { |question| link_to "Link", admin_question_path(question) }
      column "Content", :content
      column(:curator) { |question| AdminUser.find(question.admin_user_id).email unless question.admin_user_id.nil? }
      column "Replies amount", :reply_amount
      column "Status", :solved
    end

  end
end
