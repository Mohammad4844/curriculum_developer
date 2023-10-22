class CreateCurriculums < ActiveRecord::Migration[7.0]
  def change
    create_table :curriculums do |t|
      t.references :user, null: false, foreign_key: true
      t.string :major
      t.integer :time_frame
      t.integer :hrs_week
      t.string :concentration
      t.text :reason_for_pursuing

      t.timestamps
    end
  end
end
