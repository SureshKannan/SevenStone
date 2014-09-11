class User < ActiveRecord::Base
  
   scope :pageUser, ->(pageSize,startIndex,orderBy) {User.limit(pageSize).offset(startIndex).order(orderBy)}
  
  
  has_many :role
  belongs_to :group
  
  has_many :ticket
end
