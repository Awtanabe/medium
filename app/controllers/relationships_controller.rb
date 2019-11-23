class RelationshipsController < ApplicationController
  def create
     current_user.follow(User.find(params[:other_user_id]))
    redirect_to "/"
  end

  def destroy
    current_user.unfollow(User.find(params[:other_user_id]))
    redirect_to "/"
  end
end
