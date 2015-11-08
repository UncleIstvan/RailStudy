class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.string :name
      t.string :task_status
      t.timestamps null: false
    end
  end
end
