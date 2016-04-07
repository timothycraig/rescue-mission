class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question added successfully!"
      redirect_to question_path(@question)
    else
      flash[:error] = "Check the Question Criteria! #{@question.errors.full_messages.join ", "}."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save
      flash[:success] = "Question updated."
      redirect_to question_path(@question)
    else
      flash[:error] = "Invalid entry"
      redirect_to edit_question_path(@question)
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
    if @question.destroy
      @answers.each do |answer|
        answer.destroy
      end
      flash[:success] = "Question deleted."
      redirect_to questions_path
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :question_body)
  end

end
