module RelationshipsHelper
  def user_unfollow user.id
    current_user.active_relationships.find_by(followed_id: user.id)
  end

  def user_follow
    current_user.active_relationships.build
  end
end
