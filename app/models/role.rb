class Role < ActiveRecord::Base
  validates :name, uniqueness: {case_sensitive: false}
  validates :name, presence: true

  scope :pageRole, ->(pageSize,startIndex,orderBy) {Role.limit(pageSize).offset(startIndex).order(orderBy)}
  belongs_to :user

end
