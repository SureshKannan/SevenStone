class User < ActiveRecord::Base
  validates :firstname, :presence => true
  validate :lastname, :presence => true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validate :password, :presence => true
  validates :role, :presence => true
  validates :group, :presence => true
  
  
  belongs_to :role,:class_name=>"Role",:foreign_key=>"role_id"
  belongs_to :group,:class_name=>"Group",:foreign_key=>"group_id"
end
