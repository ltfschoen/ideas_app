class AddUrlToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :url, :string
  end
end
