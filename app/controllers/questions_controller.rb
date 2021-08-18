class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index

  end

  def show

  end

  def create
    @test.questions.new(question_params)
    render plain: 'Question created'

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @question.destroy
    redirect_to action: :index, test_id: @question.test_id
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found(exception)
    render plain: "#{exception.model} with id #{exception.id} not found."
  end

end
