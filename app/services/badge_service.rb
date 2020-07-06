class BadgeService
  BADGES_RULES = {
    'Pass all tests of category': :complete_category,
    'Pass the test on the first try': :first_try,
    'Pass all tests of a certain level': :complete_level
  }

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.map do |badge|
      badge if send("#{badge.rule}?", badge.value)
    end
  end

  private

  def first_try?
    tests = @user.tests.where(title: @test.title)
    @test_passage.successful? && tests.count == 1 
  end

  def complete_level?(level)
    tests = @user.tests_by_level(level).uniq
    @test_passage.successful? && tests.count == Test.where(level: level).count 
  end

  def complete_category?(category_id)
    tests = @user.tests.where(category_id: category_id).uniq
    @test_passage.successful? && tests.count == Test.where(category_id: category_id).count
  end 
end