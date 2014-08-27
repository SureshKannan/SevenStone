class Group < ActiveRecord::Base
  validates :name, uniqueness: {case_sensitive: false}
  validates :name, presence: true

  scope :pageGroup, ->(pageSize,startIndex,orderBy) {Group.limit(pageSize).offset(startIndex).order(orderBy)}
  
  has_one :user
end
