module VotesHelper
  def vote_or_dislike_btn(article)
    vote = Vote.find_by(article: article, voter: current_user)
    if vote
      link_to('Down Vote', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: 'btn btn-danger')
    else
      link_to('Up Vote', article_votes_path(article_id: article.id, user_id: current_user.id), method: :post, class: 'btn btn-primary')
    end
  end
end