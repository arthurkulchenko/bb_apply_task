class FindUserIdByReplyParamsService
  attr_reader :user_type, :user_email

  def initialize params
    @user_type = params[:user_type]
    @user_email = params[:email]
  end

  def perform
    user_type.classify.constantize.find_by(email: user_email).id
  end
end
