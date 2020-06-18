class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      reward(badge) if send("#{badge.rule}?")
    end
  end

  def reward(badge)
    @user.badges << badge
  end

  def first_try?
    @user.tests.where(title: @test.title).count == 1
  end

  def complete_level?
    @user.tests_by_level(@test.level).uniq.count == Test.where(level: @test.level).count
  end

  def complete_category?
    @user.tests.where(category_id: @test.category.id).uniq.count == Test.where(category_id: @test.category.id).count
  end
end