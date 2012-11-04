class Job < ActiveRecord::Base
  attr_accessible :user_id


  has_many :request

  belongs_to :users

  # attr_accessible :title, :body
end
