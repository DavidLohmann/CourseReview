class AddGroupsToReviews < ActiveRecord::Migration
  def change
       add_column :reviews, :groups, :string
  end
end
