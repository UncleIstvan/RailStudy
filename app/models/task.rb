class Task < ActiveRecord::Base

  belongs_to :tasktype

  validates :name,  presence: true, allow_blank: false, length:  {maximum: 500}
  validates :tasktype_id,  presence: true, allow_blank: false
end
