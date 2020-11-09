module FollowingsHelper
  def nu_display(current_user, n_user)
    return unless n_user != current_user

    following = Following.find_by(user_id: n_user.id, follow_id: current_user.id)
    following = Following.find_by(user_id: current_user.id, follow_id: n_user.id) if following.nil?

    if current_user == n_user
      content_tag :button, (link_to 'Unfollow', following_path(id: following.id),
                                    method: :delete, data: { confirm: 'Are you sure?' }),
                  class: 'btn btn-outline-danger mytext',
                  type: 'button'
    elsif current_user.follow?(n_user)
      content_tag :button, (link_to 'Unfollow', following_path(id: following.id),
                                    method: :delete, data: { confirm: 'Are you sure?' }),
                  class: 'btn btn-outline-danger my-text',
                  type: 'button'
    else
      content_tag :button, (link_to 'Follow', followings_path(user_id: current_user.id, follow_id: n_user.id),
                                    method: :post), class: 'btn btn-outline-primary my-text', type: 'button'
    end
  end

  def user_display?(a_user, a_friend)
    return if !current_user == a_user

    following = Following.find_by(user_id: a_user.id, follow_id: a_friend.id)
    following = Following.find_by(user_id: a_friend.id, follow_id: a_user.id) if following.nil?

    if current_user == a_user && current_user.follow?(a_friend)
      link_to 'Unfollow', following_path(id: following.id), method: :delete, class: 'btn btn-danger'
    elsif !current_user.follow?(a_friend)
      link_to 'Follow', followings_path(user_id: current_user.id, follow_id: a_user.id),
              method: :post, class: 'btn btn-primary'
    end
  end
end
