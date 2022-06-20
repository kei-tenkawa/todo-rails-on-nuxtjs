class ChangeTasksNameNotNullAndEtc < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :name, false
    add_index :tasks, :name, unique: true
  end

  def up
    change_column :tasks, :name, :string, limit: 30
  end

  def down
    change_column :tasks, :name, :string
  end
end
