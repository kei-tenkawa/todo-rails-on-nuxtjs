interface base {
  id: number,
  created_at: Date,
  updated_at: Date
}

export interface User extends base {
  email: string,
  password: string,
  admin: number,
  department_id: number,
  section_id: number,
}

export interface Task extends base {
  name: string,
  description: string,
  user_id: number,
  task_type_id: number,
  task_status_id: number
}

// export interface TaskTypes {

// }

// export interface TaskStatuses {

// }

// export interface Departments {

// }