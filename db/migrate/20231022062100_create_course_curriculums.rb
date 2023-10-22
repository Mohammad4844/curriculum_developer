class CreateCourseCurriculums < ActiveRecord::Migration[7.0]
  def change
    create_table :course_curriculums do |t|
      t.references :course, null: false, foreign_key: true
      t.references :curriculum, null: false, foreign_key: true
      t.string :level
      t.boolean :completed

      t.timestamps
    end
  end
end
