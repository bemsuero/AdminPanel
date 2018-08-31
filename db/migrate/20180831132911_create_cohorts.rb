class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :start
      t.date :end
      t.integer :course_id
      t.integer :max_students
      t.string :description

      t.timestamps
    end
  end
end
