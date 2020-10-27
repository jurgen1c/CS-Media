module FollowingHelper
  def nu_display(current_user, n_user)
    return unless n_user != current_user

    following = Following.find_by(user_id: n_user.id, follow_id: current_user.id)
    following = Following.find_by(user_id: current_user.id, follow_id: n_user.id) if following.nil?

    if current_user == n_user
      content_tag(:td, (link_to 'Unfollow', followings_path(id: following.id), method: :delete))
    elsif current_user.follow?(n_user)
      content_tag(:td, (link_to 'Unfollow', followings_path(id: following.id), method: :delete))
    else
      content_tag(:td, (link_to 'Follow', followings_path(confirmed: false, user_id: current_user.id,
                                                               follow_id: n_user.id), method: :post))
    end
  end

  def user_display?(a_user, a_friend)
    return if !current_user == a_user

    following = Following.find_by(user_id: a_user.id, follow_id: a_friend.id)
    following = Following.find_by(user_id: a_friend.id, follow_id: a_user.id) if following.nil?

    if current_user == a_user && current_user.follow?(a_friend)
      content_tag(:td, (link_to 'Unfollow', followings_path(id: following.id), method: :delete))
    elsif !current_user.follow?(a_friend)
      content_tag(:td, (link_to 'Follow', followings_path(user_id: current_user.id,
                                                               follow_id: a_user.id), method: :post))
    end
  end
end