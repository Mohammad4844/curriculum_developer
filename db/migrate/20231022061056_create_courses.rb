class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :prereqs
      t.integer :course_hrs_week
      t.integer :recitation_hrs_week
      t.string :taught_by
      t.string :offered_by

      t.timestamps
    end
  end
end
