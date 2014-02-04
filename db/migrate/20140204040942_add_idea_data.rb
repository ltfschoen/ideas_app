require 'fileutils'
require 'csv'

class AddIdeaData < ActiveRecord::Migration

  def up

		filename_new = "ideas"

		if File.file?("/Users/Luke/Documents/w5d1_project/ideas_app/db/#{filename_new}.csv")
			CSV.foreach("/Users/Luke/Documents/w5d1_project/ideas_app/db/#{filename_new}.csv")do |col|
				Idea.create(:name => col[0].to_s, :description => col[1].to_s, :author => col[6].to_s, :url => col[7].to_s, :country => col[8].to_s)
			end
		else 
			raise "No file exists with name: #{filename_new}"
		end
  end

  def down
  	Idea.all.destroy # only with team permission
  end

end
