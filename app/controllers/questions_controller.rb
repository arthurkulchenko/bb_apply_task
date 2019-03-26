class QuestionsController < ApplicationController
  before_action :create_question, only: [:create]
  before_action :questions_load, only: [:index, :create]

  def index
    @action_button = true
  end

  def show
    @question = Question.find params[:id]
    @action_button = false
  end

  def create
    if @question_wrapper.errors.empty?
      redirect_to question_path(@question_wrapper.question)
    else
      @errors = @question_wrapper.errors
      render "index"
    end
  end

  private

  def create_question
    @question_wrapper = InitializeAndCreateQuestion.new(params).perform
  end

  def questions_load
    @questions = Question.all
  end

  def question_params
    params.require(:question).permit(:title, :content, :email)
  end
end
