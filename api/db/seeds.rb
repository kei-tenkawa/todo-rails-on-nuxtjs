# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# 開発本部 開発部,開発6ｸﾞﾙｰﾌﾟ
# seedする前に一回消す
CSV.foreach('db/dpseed.csv', headers: true) do |row|
  if row[1].blank?
    Department.create(name: row[0])
  else
    dep = Department.find_by name: row[0]
    Section.create({ name: row[1], department_id: dep.id })
  end
end

# taks_status
TaskStatus.create({ name: "未着手" })

# tasksテストデータ
CSV.foreach('db/task-2023011842.csv', headers: true) do |row|
  Task.create({ name: row[0], description: row[1], user_id: 1, task_type_id: 1, task_status_id: 1 })
end