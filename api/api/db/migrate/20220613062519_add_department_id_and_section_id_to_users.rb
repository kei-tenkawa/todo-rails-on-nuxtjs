class AddDepartmentIdAndSectionIdToUsers < ActiveRecord::Migration[5.2]
  def up
    add_reference :users, :department, index: true
    add_reference :users, :section, index: true
  end

  def down
    remove_reference :users, :department, index: true
    remove_reference :users, :section, index: true
  end
end
