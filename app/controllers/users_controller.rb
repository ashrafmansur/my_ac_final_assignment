class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @notes = @user.notes
    @following = Following.where(followee_id: @user.id)
    @currentfollowers = @following.pluck(:follower_id)
  end

end
