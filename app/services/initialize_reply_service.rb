class InitializeReplyService

  attr_reader :income_params, :question, :user_id
  attr_accessor :reply, :errors

  def initialize params
    @income_params = params
    @question = Question.find(params[:question_id])
    @user_id = FindUserIdByReplyParamsService.new({
                                                    "user_type": params[:reply][:user_type],
                                                    "email": params[:reply][:email]
    }).perform
    @reply = Reply
    @errors = []
  end

  def perform
    instantiate
    validate
    if errors.empty?
      self.reply.save
      notify
      update_question
    end
    self
  end

  private

  def update_question
    @replies_amount = question.replies.count
    if !question.admin_user_id? && ( reply.user_type == 'AdminUser' )
      self.question.update(admin_user_id: user_id, reply_amount: "#{@replies_amount}")
    end
    # CHECK do not update question if passet integer
    # self.question.update(reply_amount: @reply_amount)
    self.question.update(reply_amount: "#{@replies_amount}")
  end

  def notify
    if reply.user_type == 'AdminUser'
      ReplyNotificationJob.perform_now question.plain_user.email, content, question.title
    elsif question.admin_user_id?
      ReplyNotificationJob.perform_now question.admin_user.email, content, question.title
    end
  end

  def validate
    reply.valid? ? self.errors = [] : self.errors = reply.errors.full_messages
  end

  def reply_attributes
    @attributes = {
      "content": income_params[:reply][:content],
      "user_type": income_params[:reply][:user_type],
      "user_id":   user_id
    }
  end

  def instantiate
    self.reply = question.replies.new(reply_attributes)
  end
end
