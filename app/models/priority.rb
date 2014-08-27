class Priority < ActiveRecord::Base
  validates :name, uniqueness: {case_sensitive: false}
  validates :name, presence: true

  scope :pageStatus, ->(pageSize,startIndex,orderBy) {Priority.limit(pageSize).offset(startIndex).order(orderBy)}
  
  belongs_to :ticket
end
