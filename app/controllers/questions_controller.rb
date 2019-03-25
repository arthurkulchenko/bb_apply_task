class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
    @replies = @question.replies
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
    @email = params.delete(:email)
    # TODO @user = FindOrCreateNewPlainUser.new(@email)
    @user = if PlainUser.find_by(email: @email)
      PlainUser.find_by(email: @email)
    else
      PlainUser.create(email: @email)
    end
    params[:plain_user_id] = @user.id

    params
  end

  def question_params
    params.require(:question).permit(:title, :content, :email, replies_attributes: [:id, :content, :user_type, :user_id])
  end
end
