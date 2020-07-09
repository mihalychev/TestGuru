module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message
    flash.map do |key, message|
      content_tag :div, message.html_safe, class: "flash flash_#{key}"
    end.join.html_safe
  end

  def badge_rule_collection
    I18n.t('badge_rules').invert
  end
end
