class Request < ActiveRecord::Base
  attr_accessible :fee, :item, :isOpen, :location, :target, :time_max, :time_min, :time_min_date, :time_min_hhmm, :time_max_date, :time_max_hhmm

  attr_accessor :time_min_hhmm
  attr_accessor :time_min_date
  attr_accessor :time_max_hhmm
  attr_accessor :time_max_date

  belongs_to :users
  belongs_to :jobs
end
	