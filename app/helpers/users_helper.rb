module UsersHelper

	def random_user_set (num)
		ids = User.ids
		users = []
		while users.count < num
			index = rand(0..ids.count-1)
			users << User.find(ids[index])
			ids.delete_at(index)
		end
		return users
	end
end
