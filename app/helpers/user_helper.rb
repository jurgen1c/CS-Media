module UserHelper
  def art_options(article)
    if current_user == article.author
      content_tag :button, (link_to 'Edit', edit_article_path(article)), class: 'btn btn-outline-secondary', type: 'button'
      content_tag :button, (link_to 'Destroy', article, method: :delete, data: { confirm: 'Are you sure?' }), class: 'btn btn-outline-danger', type: 'button'
    else 
      nil
    end
  end

  def rev_options(review)
    if current_user == review.reviewer
      link_to 'Edit', edit_article_review_path(@article), class: 'btn btn-secondary'
      link_to 'Destroy', article_review_path(review), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger'
    else
      nil
    end
  end

  def com_options(comment)
    if current_user == comment.user
      link_to 'Destroy', article_comment_path(comment), method: :delete, data: { confirm: 'Are you sure?' }
    else
      nil
    end
  end
end