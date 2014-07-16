class EnterpriseApplication < ActiveRecord::Base
  validates :name, uniqueness: {case_sensitive: false}
  validates :name, presence: true

  scope :pageEnterpriseApplication, ->(pageSize,startIndex,orderBy) {EnterpriseApplication.limit(pageSize).offset(startIndex).order(orderBy)}
end
