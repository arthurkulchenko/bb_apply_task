class RepliesController < ApplicationController
  before_action :create_reply, only: [:create]

  def create
    if @wrapped_reply.errors.empty?
      redirect_to question_path @wrapped_reply.question
    else
      @errors = @wrapped_reply.errors
      render template: 'questions/show'
    end
  end

  private

  def create_reply
    @wrapped_reply = InitializeReplyService.new(params).perform
  end

  def replies_params
    params.require(:reply).permit(:content, :email, :user_type)
  end
end
