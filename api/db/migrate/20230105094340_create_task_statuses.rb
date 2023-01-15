class CreateTaskStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :task_statuses do |t|
      t.references :tasks, null: false
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end