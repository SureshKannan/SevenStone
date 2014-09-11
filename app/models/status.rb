class Status < ActiveRecord::Base
  validates :name, uniqueness: {case_sensitive: false}
  validates :name, presence: true

  scope :pageStatus, ->(pageSize,startIndex,orderBy) {Status.limit(pageSize).offset(startIndex).order(orderBy)}
  
  has_many :ticket
end
