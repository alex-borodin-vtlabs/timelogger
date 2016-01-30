class Task < ActiveRecord::Base
	belongs_to :project
	has_many :intervals
	validates_presence_of :name
end
