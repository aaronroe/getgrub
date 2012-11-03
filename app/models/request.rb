class Request < ActiveRecord::Base
  attr_accessible :fee, :item, :isOpen, :location, :target, :time_max, :time_min

  belongs_to :user
  belongs_to :job
end
