class User < ActiveRecord::Base
  
   scope :pageUser, ->(pageSize,startIndex,orderBy) {User.limit(pageSize).offset(startIndex).order(orderBy)}
  
  
  belongs_to :role
  belongs_to :group
  
  belongs_to :ticket
end
