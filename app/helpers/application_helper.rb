module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(type)
    content_tag :p, flash[type.to_sym], class: "flash flash_#{type}"
  end
end
