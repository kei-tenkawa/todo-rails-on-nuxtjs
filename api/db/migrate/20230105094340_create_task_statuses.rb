class CreateTaskStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :task_statuses do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end

    add_reference :tasks, :task_status, null: false, foreign_key: true
  end
end