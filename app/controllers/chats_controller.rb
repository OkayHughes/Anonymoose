class ChatsController < ApplicationController
	include UsersHelper

	def index
		@chats = current_user.chats.order('updated_at DESC')
		@chat = @chats.first 
		@chat ||= Chat.new()
		@message = Message.new()
	end

	def show
		@chat = Chat.find(params[:id])
		@message = Message.new()
		respond_to do |format|
			format.js
		end
	end

	def new
		@chat = Chat.new
	end

	def create
		@chat = Chat.new()
		@chat.save
		@chat.users << current_user
		current_user.friends.each do |f|
			if params[f.name] == '1'
				@chat.users << f
			end
		end
		if params['random'] == '1'
			@chat.users += random_user_set params['amount'][0].to_i	
		end

		redirect_to root_url
	end

end
