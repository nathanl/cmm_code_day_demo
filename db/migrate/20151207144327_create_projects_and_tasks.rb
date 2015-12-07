class CreateProjectsAndTasks < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :company_id, null: false
      t.string :name, null: false
    end

    add_foreign_key :projects, :companies
    add_index :projects, :company_id

    create_table :tasks do |t|
      t.integer :project_id, null: false
      t.string :name, null: false
    end

    add_foreign_key :tasks, :projects
    add_index :tasks, :project_id

    create_table :sessions do |t|
      t.integer :task_id, null: false
      t.date :date, null: false
      t.string :description
      t.integer :duration_in_minutes, null: false, default: 0
      t.datetime :active_timer_start
    end

    add_foreign_key :sessions, :tasks
    add_index :sessions, :task_id
  end
end
