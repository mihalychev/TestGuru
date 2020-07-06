class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      user_badges = BadgeService.new(@test_passage).call
      current_user.badges = user_badges
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    response = service.call

    url = response[:html_url]

    if service.success?
      current_user.gists.create(question: @test_passage.current_question, url: url)
      flash_options = { notice: t('.success', link: view_context.link_to('Link', url, target: '_blank')) }
    else
      flash_options = { alert: t('.failure') }
    end
    
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
