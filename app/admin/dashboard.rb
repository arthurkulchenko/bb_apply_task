ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    #   div class: "blank_slate_container", id: "dashboard_default_message" do
    #     span class: "blank_slate" do
    #       span I18n.t("active_admin.dashboard_welcome.welcome")
    #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #     end
    #   end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # table_for Question.all do
    #   column(:payment_type) { |payment| payment.payment_type.titleize }
    #   column "Received On",     :created_at
    #   column "Details & Notes", :payment_details
    #   column "Amount",          :amount_in_dollars
    # end
    columns do
      column span: 0.5 do
        span "Date", 'data'
      end

      column span: 2 do
        span "Title"
      end

      column do
        span "Status"
      end

      column do
        span "Admin"
      end
    end

    # columns do
    #   column do
    #     # panel "Questions" do
    #     #   ul do
    #     #     Question.all.map do |question|
    #     #       li link_to(question.content, admin_question_path(question))
    #     #     end
    #     #   end
    #     # end
    #   end
    # end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
