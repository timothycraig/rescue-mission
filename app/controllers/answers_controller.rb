class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      flash[:success] = "Answer added!"
    else
      flash[:error] = "#{@answer.errors.full_messages.join ", "}"
    end
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:answer_body)
  end
end
