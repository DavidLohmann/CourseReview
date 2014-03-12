class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :department_id
      t.integer :course_code
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
