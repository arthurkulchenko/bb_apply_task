class RepliesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @user = params[:reply][:user_type].classify.constantize.find_by(email: params[:reply].delete(:email))
    @reply = @question.replies.new(replies_params)
    @reply.user = @user
    if @reply.save!
      redirect_to @question
    else
      @errors = @reply.errors.full_messages
      render @question
    end
  end

  private

  def replies_params
    params.require(:reply).permit(:content, :email, :user_type)
  end
end
