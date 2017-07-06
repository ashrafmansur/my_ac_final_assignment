class FollowingsController < ApplicationController

  before_action :set_user

  def create
    @following = Following.create(follower_id: current_user.id, followee_id: @user.id)

    if @following.save
      redirect_to user_path(@user)
    end
  end

  def destroy
    @following = Following.find_by("follower_id = ? AND followee_id = ?", current_user.id, @user.id)
    if @following.destroy
      redirect_to user_path(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
