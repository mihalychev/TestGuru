class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy edit update]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to_test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to_test
    else
      render :edit
    end
  end

  def show
    render plain: @question.text
  end

  def destroy
    @question.destroy
    redirect_to_test
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:id] ? params[:id] : params[:test_id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_question_not_found
    render plain: 'Error'
  end

  def redirect_to_test
    redirect_to controller: 'tests', action: 'show', id: @question.test_id
  end
end
