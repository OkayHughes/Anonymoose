class Message < ActiveRecord::Base
	belongs_to :chat;
	validates :content, presence: true, length: {minimum: 1}
end
