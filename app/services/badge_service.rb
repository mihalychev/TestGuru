class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select { |badge| send("#{badge.rule}?", badge) }
  end

  private

  def first_try?
    return if !@test_passage.successful? || @user.badges.include?(badge)
    tests = completed_tests.select { |test| test.title == @test.title }
    tests.count == 1
  end

  def complete_level?(badge)
    return if !@test_passage.successful? && @test.level != level || @user.badges.include?(badge)
    tests = completed_tests.select { |test| test.level == @test.level }
    tests.uniq.count == Test.where(level: badge.value).count
  end

  def complete_category?(badge)
    return if !@test_passage.successful? && @test.category_id != category_id || @user.badges.include?(badge)
    tests = completed_tests.select { |test| test.category_id == @test.category_id }
    tests.uniq.count == Test.where(category_id: badge.value).count
  end

  def completed_tests
    @user.test_passages.map { |test_passage| test_passage.test if test_passage.successful? }
  end
end