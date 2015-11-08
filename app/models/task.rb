class Task < ActiveRecord::Base

  @@task_status = ['pending', 'completed']

  def self.task_status
    @@task_status
  end

end
