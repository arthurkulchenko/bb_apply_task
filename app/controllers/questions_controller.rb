class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @action_button = true
  end

  def show
    @question = Question.find params[:id]
    @replies = @question.replies
    @action_button = false
  end

  def create
    @questions = Question.all
    @question = Question.new(processed_params(question_params))

    if @question.save
      redirect_to question_path @question
    else
      @errors = @question.errors.full_messages
      render "index"
    end
  end

  private

  def processed_params params
    @user = PlainUser.find_or_create_by(email: params.delete(:email))
    params[:plain_user_id] = @user.id
    params
  end

  def question_params
    params.require(:question).permit(:title, :content, :email)
  end
end
