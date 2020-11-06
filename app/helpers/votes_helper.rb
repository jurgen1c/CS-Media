module VotesHelper
  def vote_or_dislike_btn(article)
    vote = Vote.find_by(article: article, voter: current_user)
    if vote
      content_tag :button, (link_to 'Down Vote', article_vote_path(id: vote.id, article_id: article.id),
                                    method: :delete), class: 'btn btn-outline-danger my-text', type: 'button'
    else
      content_tag :button, (link_to 'Up Vote', article_votes_path(article_id: article.id, user_id: current_user.id),
                                    method: :post), class: 'btn btn-outline-primary my-text', type: 'button'
    end
  end
end
