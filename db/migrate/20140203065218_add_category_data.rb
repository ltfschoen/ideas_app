require 'fileutils'
require 'csv'

class AddCategoryData < ActiveRecord::Migration
  def up

		filepath = Rails.root.join("categories.csv")		

		if File.exist?(filepath)
			CSV.foreach(filepath)do |col|
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