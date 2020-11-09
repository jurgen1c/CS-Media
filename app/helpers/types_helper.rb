module TypesHelper
  def count_type(article, count)
    return if article.nil?

    title = content_tag :h4, (
      link_to article.title, article, class: 'my-subtitle pl-1'
    )
    author = content_tag :h6, (
      link_to "Author: #{article.author.name}", user_path(article.author.id),
              class: 'my-subtitle pl-1'
    )
    content = content_tag :p,
                          truncate(strip_tags(article.rich_text_body.to_s), length: 150),
                          class: 'my-text'
    votes = content_tag :div,
                        vote_or_dislike_btn(article),
                        class: 'd-flex mytext'
    text = content_tag :div, (title + author + content + votes), class: 'half p-2 my-border'
    blob = content_tag :div,
                       image_tag(article.cover, style: 'width: 100%; height: 100%'),
                       class: 'half'
    if count.odd?
      content_tag :div,
                  (blob + text).html_safe,
                  class: 'col-12 col-md-6 p-0 d-flex'
    else
      content_tag :div,
                  (text + blob).html_safe,
                  class: 'col-12 col-md-6 p-0 d-flex'
    end
  end
end
