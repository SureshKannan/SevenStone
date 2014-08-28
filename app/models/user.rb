class User < ActiveRecord::Base
  belongs_to :role,:class_name=>"Role",:foreign_key=>"role_id"
  belongs_to :group,:class_name=>"Group",:foreign_key=>"group_id"
end
