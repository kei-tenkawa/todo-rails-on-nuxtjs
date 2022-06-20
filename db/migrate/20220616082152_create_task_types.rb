class CreateTaskTypes < ActiveRecord::Migration[5.2]
  def up
    create_table :task_types do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end

    add_reference :tasks, :task_type

    task_type = TaskType.create(name: "作業")
    Task.all.update_all(task_type_id: task_type.id)
  end

  def down
    remove_reference :tasks, :task_type

    drop_table :task_types
  end
end
