class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.integer :tasktype_id
      t.string :name
      t.string :task_status, default: 'pending'
      t.timestamps null: false
    end
  end
end
