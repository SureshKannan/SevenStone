class Category < ActiveRecord::Base
  validates :name, uniqueness: {case_sensitive: false}
  validates :name, presence: true

  scope :pageCategory, ->(pageSize,startIndex,orderBy) {Category.limit(pageSize).offset(startIndex).order(orderBy)}
  
  belongs_to :ticket
end
