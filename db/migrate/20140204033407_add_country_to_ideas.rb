class AddCountryToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :country, :string
  end
end
