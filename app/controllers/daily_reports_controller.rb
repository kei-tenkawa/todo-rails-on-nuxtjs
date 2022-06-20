class DailyReportsController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  # textareaに日報データをぶち込む方針だったが
  # HTMLタグがうまく変換されないため
  # なんか変な記述になっている
  def create
    department = Department.where(id: current_user.department_id).first
    section = Section.where(id: current_user.section_id).first
    task_types = TaskType.all
    @tasks = current_user.tasks

    done = daily_report_params[:done]
    done_list = []

    done.each do |item|
      next if item == ''

      done_list << @tasks.where(id: item).first
    end

    schedule = daily_report_params[:schedule]
    schedule_list = []

    schedule.each do |item|
      next if item == ''

      schedule_list << @tasks.where(id: item).first
    end

    # 所属
    syozoku = "#{department.name}/#{section.name}"

    # 労働時間
    t = Time.now + 9 * 60 * 60
    nippou = []
    start_time = daily_report_params[:start_time]
    end_time = t.strftime('%H:%M')
    work_time = "#{start_time} ~ #{end_time}"

    # start 詳細
    detail = ''
    detail += '【本日の業務内容】
    '
    task_types.each do |task_type|
      this_type_of_done = done_list.select { |n| n.task_type_id == task_type.id }
      detail += "▼ #{task_type.name}
      "
      this_type_of_done.each do |item|
        detail += "- #{item.name}
        "
        unless item.description.nil?
          detail += "#{item.description}

          "
        end
      end
    end

    detail += '
    【翌営業日の業務予定】
    '
    task_types.each do |task_type|
      this_type_of_schedule = schedule_list.select { |n| n.task_type_id == task_type.id }
      detail += "▼ #{task_type.name}
      "
      this_type_of_schedule.each do |item|
        detail += "- #{item.name}
        "
        unless item.description.nil?
          detail += "#{item.description}

          "
        end
      end
    end

    detail += '

    【本日の仕事で良かったこと/その他ひとこと】
    '
    detail += daily_report_params[:comment]

    # end 詳細

    @nippou_text = "【日報】#{syozoku} #{current_user.name}
    "
    @nippou_text += "勤務時間：#{work_time}

    "
    @nippou_text += detail

    @nippou_text += "

    以上です。
    ※ produced by tenkawa task tool"

    render 'index'
  end

  private

  def daily_report_params
    params.require(:daily_report).permit(:start_time, :comment, done: [], schedule: [])
  end
end
