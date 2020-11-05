module UserHelper
  def art_options(article)
    if current_user == article.author
      edit = content_tag :button, (link_to 'Edit', edit_article_path(article)), class: 'btn btn-outline-secondary', type: 'button'
      destroy = content_tag :button, (link_to 'Destroy', article, method: :delete, data: { confirm: 'Are you sure?' }), class: 'btn btn-outline-danger', type: 'button'
      edit.concat(destroy)
    else 
      nil
    end
  end

  def rev_options(review)
    if current_user == review.reviewer
      edit = content_tag :button, (link_to 'Edit', edit_article_review_path(review)), class: 'btn btn-outline-secondary', type: 'button'
      destroy = content_tag :button, (link_to 'Destroy', article_review_path(review), method: :delete, data: { confirm: 'Are you sure?' }), class: 'btn btn-outline-danger', type: 'button'
      edit.concat(destroy)
    else
      nil
    end
  end

  def com_options(comment)
    if current_user == comment.user
      content_tag :button, (link_to 'Destroy', article_comment_path(comment), method: :delete, data: { confirm: 'Are you sure?' }), class: 'btn btn-outline-danger', type: 'button'
    else
      nil
    end
  end
end