class MessagesController < ApplicationController

	def create
		@message = Message.new(message_params)
		@chat = Chat.find(@message.chat_id)
		respond_to do |format|
			if @message.save
				format.js
			else
				flash[:notice] = @message.errors
				format.js
			end
		end
	end

	private

	def message_params
		params.require(:message).permit(:content, :chat_id)
	end
end
