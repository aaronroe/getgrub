class Job < ActiveRecord::Base
  
  has_many :request

  belongs_to :users

  # attr_accessible :title, :body
end
