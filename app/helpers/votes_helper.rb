module VotesHelper
  def vote_or_dislike_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Down Vote', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Up Vote', post_likes_path(post_id: post.id), method: :post)
    end
  end
end