class BadgeService
  BADGE_RULES = [:complete_category, :first_try, :complete_level]

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select { |badge| send("#{badge.rule}?", badge) }
  end

  private

  def first_try?(badge)
    return if !@test_passage.successful?
    tests = completed_test_passages.where(tests: { title: @test.title })
                                   .map { |test_passage| test_passage.test }
    tests.count == 1
  end

  def complete_level?(badge)
    return if !@test_passage.successful? && @test.level != badge.value
    completion_check('level', badge)
  end

  def complete_category?(badge)
    return if !@test_passage.successful? && @test.category_id != badge.value
    completion_check('category_id', badge)
  end

  def completed_test_passages
    @user.test_passages.joins(:test).where(passed: true)
  end

  def award_date(badge)
    @user.user_badges.where(badge: badge)
                     .order(created_at: :desc).first&.created_at
  end

  def completion_check(par, badge)
    if @user.badges.include?(badge)
      tests = completed_test_passages.where(tests: { "#{par}" => badge.value })
                                     .where("test_passages.created_at > ?", award_date(badge))
                                     .map { |test_passage| test_passage.test }
    else
      tests = completed_test_passages.where(tests: { "#{par}" => badge.value })
                                     .map { |test_passage| test_passage.test }
    end

    tests.uniq.count == Test.where("#{par}" => badge.value).count
  end
end