class Job < ActiveRecord::Base
  
  has_many :request

  belongs_to :user

  # attr_accessible :title, :body
end
