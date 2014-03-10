class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true
      t.references :commentable, polymorphic: true, index: true
      # add polymorphic: true so it adds the extra column

      t.timestamps
    end
  end
end
