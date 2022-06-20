class CreateDepartmentsAndSections < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name, null: false, unique: true
      # t.integer :section_id  # reference貼ったら自動で作ってくれる説

      t.timestamps
    end

    create_table :sections do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end

    add_reference :sections, :department
  end
end
