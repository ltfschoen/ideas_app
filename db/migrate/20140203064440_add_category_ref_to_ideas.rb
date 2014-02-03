class AddCategoryRefToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :category, index: true
  end
end
