module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message
    flash.map do |key, message|
      content_tag :p, message, class: "flash flash_#{key}"
    end.join.html_safe
  end
end
