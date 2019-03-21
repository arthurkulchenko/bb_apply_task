class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render :new, notice: @question.errors.full_messages
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
