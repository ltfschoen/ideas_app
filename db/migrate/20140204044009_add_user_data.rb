require 'fileutils'
require 'csv'

class AddUserData < ActiveRecord::Migration

  def up

		# filepath = Rails.root.join("users.csv")	


		# if File.file?(filepath)
		# 	CSV.foreach(filepath)do |col|
		# 		u = User.new(:name => col[0].to_s, :email => col[1].to_s, :age => col[13].to_i, :kind => col[14].to_s)
		# 		#u.:password = "password" 
		# 		#u.:password_confirmation = "password"
		# 		# password is hidden, but different from encrypted password
		# 		u.save
		# 	end
		# else 
		# 	raise "No file exists with name: #{filepath}"
		# end
  end

  def down
  	# User.all.destroy # only with team permission
  end

end