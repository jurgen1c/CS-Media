module UserHelper
  def art_options(article)
    return unless current_user == article.author

    edit = content_tag :button, (link_to 'Edit', edit_article_path(article)),
                       class: 'btn btn-outline-secondary my-text', type: 'button'
    destroy = content_tag :button, (link_to 'Destroy', article, method: :delete, data: { confirm: 'Are you sure?' }),
                          class: 'btn btn-outline-danger my-text', type: 'button'
    edit.concat(destroy)
  end

  def rev_options(review)
    return unless current_user == review.reviewer

    edit = content_tag :button, (link_to 'Edit', edit_article_review_path(review)),
                       class: 'btn btn-outline-secondary my-text', type: 'button'
    destroy = content_tag :button, (link_to 'Destroy', article_review_path(review),
                                            method: :delete, data: { confirm: 'Are you sure?' }),
                          class: 'btn btn-outline-danger my-text', type: 'button'
    edit.concat(destroy)
  end

  def com_options(comment)
    return unless current_user == comment.user

    content_tag :button, (link_to 'Destroy', article_comment_path(comment),
                                  method: :delete, data: { confirm: 'Are you sure?' }),
                class: 'btn btn-outline-danger my-text', type: 'button'
  end
end
