class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :course_id
      t.string :title
      t.text :body
      t.string :professor
      t.string :workload
      t.string :focus
      t.string :cases
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
