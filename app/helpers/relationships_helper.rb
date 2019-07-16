module RelationshipsHelper
  def user_unfollow id
    current_user.active_relationships.find_by(followed_id: id)
  end

  def user_follow
    current_user.active_relationships.build
  end
end
