class Ticket < ActiveRecord::Base

  scope :pageTicket, ->(pageSize,startIndex,orderBy) {Ticket.limit(pageSize).offset(startIndex).order(orderBy)}
  
  has_many :ticket_histories
  has_many :attachments
  belongs_to :department  
  belongs_to :priorities
  belongs_to :statuses
  belongs_to :users
  belongs_to :cateories
  belongs_to :enterprise_applications
  

end
