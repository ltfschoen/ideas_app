require 'fileutils'
require 'csv'

class AddUserData < ActiveRecord::Migration

  def up

		# filename_new = "users"


		# if File.file?("/Users/Luke/Documents/w5d1_project/ideas_app/db/#{filename_new}.csv")
		# 	CSV.foreach("/Users/Luke/Documents/w5d1_project/ideas_app/db/#{filename_new}.csv")do |col|
		# 		u = User.new(:name => col[0].to_s, :email => col[1].to_s, :age => col[13].to_i, :kind => col[14].to_s)
		# 		#u.:password = "password" 
		# 		#u.:password_confirmation = "password"
		# 		# password is hidden, but different from encrypted password
		# 		u.save
		# 	end
		# else 
		# 	raise "No file exists with name: #{filename_new}"
		# end
  end

  def down
  	# User.all.destroy # only with team permission
  end

end
