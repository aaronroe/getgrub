class Request < ActiveRecord::Base
  attr_accessible :fee, :isOpen, :location, :target, :time_max, :time_min

  belongs_to :user
  belongs_to :job
end
