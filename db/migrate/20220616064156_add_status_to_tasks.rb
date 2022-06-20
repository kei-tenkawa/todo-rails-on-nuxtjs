class AddStatusToTasks < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE task_status AS ENUM ('backlog', 'wip', 'complete');
    SQL
    add_column :tasks, :status, :task_status
    Task.all.update_all(status: 'backlog')
  end

  def down
    remove_column :tasks, :status
    execute <<-SQL
      DROP TYPE task_status;
    SQL
  end
end
