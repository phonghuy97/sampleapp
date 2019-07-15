module RelationshipsHelper
  def user_unfollow current_user
    @user = User.find_by_id params[:id]
    current_user.active_relationships.find_by(followed_id: @user.id)
  end

  def user_follow current_user
    @user = User.find_by_id params[:id]
    current_user.active_relationships.build
  end
end
