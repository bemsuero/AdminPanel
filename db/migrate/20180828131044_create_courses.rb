class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :hours
      t.text :description
      t.integer :user_id

      t.timestamps
    end

    create_table :cohorts do |c|
      c.string :name
      c.date :start
      c.date :end
      c.integer :course_id
      c.integer :max_students

      c.timestamps
    end

  end
end
