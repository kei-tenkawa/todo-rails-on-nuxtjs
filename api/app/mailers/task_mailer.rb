class TaskMailer < ApplicationMailer
  default from: 'todo@example.com'

  def creation_email(task)
    @task = task
    mail(
      subject: 'タスク完了メール',
      to: 'user@example.com',
      from: 'todo@example.com'
    )
  end
end
