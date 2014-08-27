class Ticket < ActiveRecord::Base

  scope :pageTicket, ->(pageSize,startIndex,orderBy) {Ticket.limit(pageSize).offset(startIndex).order(orderBy)}
  
  has_many :ticket_histories
  has_many :departments
  has_many :attachments
  has_many :priorities
  has_many :statuses
  has_many :users
  has_many :cateories
  has_many :enterprise_applications
end
