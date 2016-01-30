class Interval < ActiveRecord::Base	
	belongs_to :task
	validates_presence_of :intrvlbegin
	validates_presence_of :intrvlend

end
