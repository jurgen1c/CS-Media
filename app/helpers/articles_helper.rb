module ArticlesHelper
  def display_errors(article)
    return unless article.errors.full_messages.any?

    content_tag :p, "Article could not be saved. #{article.errors.full_messages.join('. ')}", class: 'errors'
  end
end
