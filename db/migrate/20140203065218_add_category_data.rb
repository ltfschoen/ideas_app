require 'fileutils'
require 'csv'

class AddCategoryData < ActiveRecord::Migration
  def up

		filename_new = "categories"

		if File.file?("/Users/Luke/Documents/w5d1_project/ideas_app/db/#{filename_new}.csv")
			CSV.foreach("/Users/Luke/Documents/w5d1_project/ideas_app/db/#{filename_new}.csv")do |col|
				Category.create(:name => col[0].to_s, :description => col[1].to_s)
			end
		else 
			raise "No file exists with name: #{filename_new}"
		end
  end

  def down
  	Category.all.destroy # only with team permission
  end
end
