class FriendshipsController < ApplicationController
  def create
  	user = User.find_by_name(params[:id])
  	if user != current_user && !(current_user.friends.include?(user))
  		@friendship = current_user.friendships.build(user_id: current_user.id, friend_id: user.id)
  		if @friendship.save
  			flash[:notice] = "Added friend"
  		else
    		flash[:notice] = "Couldn't add friend"
  		end
  	end
  	redirect_to request.referer
  end
end
