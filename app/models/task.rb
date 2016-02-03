class Task < ActiveRecord::Base
	belongs_to :project
	has_many :intervals
	validates_presence_of :name
	default_scope { order("created_at DESC") }
end
