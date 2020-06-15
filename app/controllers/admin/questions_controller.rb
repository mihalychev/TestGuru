class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def show; end

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

  def destroy
    @question.destroy
    redirect_to_test
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_question_not_found
    render plain: 'Error'
  end

  def redirect_to_test
    redirect_to admin_test_path(@question.test)
  end
end
