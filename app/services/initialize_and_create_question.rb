class InitializeAndCreateQuestion
  attr_reader :title, :content, :user
  attr_accessor :errors, :question

  def initialize params
    @user = PlainUser.find_or_create_by(email: params[:question][:email])
    @title = params[:question][:title]
    @content = params[:question][:content]
    @question = Question
    @errors = []
  end

  def perform
    instantiate
    validate
    if errors.empty?
      self.question.save
      notify
    end
    self
  end

  private

  def notify
    SendNewQuestionNotificationJob.perform_now title, content
  end

  def validate
    question.valid? ? self.errors = [] : self.errors = question.errors.full_messages
  end

  def question_attributes
    { title: title, content: content }
  end

  def instantiate
    self.question = user.questions.new(question_attributes)
  end

end
