class Department < ActiveRecord::Base
  validates :name, uniqueness: {case_sensitive: false}
  validates :name, presence: true

  scope :pageDepartment, ->(pageSize,startIndex,orderBy) {Department.limit(pageSize).offset(startIndex).order(orderBy)}
  
  belongs_to :ticket
end
