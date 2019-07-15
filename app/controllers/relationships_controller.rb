class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find_by_id params[:followed_id]
    if @user
      current_user.follow @user
      respond_to :js
        format.js
      end
    else
      flash.now[:danger] = t("controllers.user.not_exits")
      redirect_to root_path
    end
  end

  def destroy
    @user = Relationship.find_by_id(params[:id]).followed
    if @user
      current_user.unfollow @user
      respond_to do |format|
        format.js
      end
    else
      flash.now[:danger] = t("controllers.user.not_exits")
      redirect_to root_path
    end
  end
end
