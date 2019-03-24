class RepliesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @user = find_user_by_email_and_type params
    @reply = @question.replies.new(processed_params(replies_params))
    @reply.user = @user
    if @reply.save!
      redirect_to @question
    else
      @errors = @reply.errors.full_messages
      render @question
    end
  end

  private

  def processed_params params
    params.delete(:email)
    params
  end

  def find_user_by_email_and_type params
    # @user = params[:reply][:user_type].classify.constantize.find_by(params[:reply].delete(:email))
    @user = params[:reply][:user_type].classify.constantize.find_by(email: params[:reply][:email])
  end

  def replies_params
    params.require(:reply).permit(:content, :email, :user_type)
  end
end
