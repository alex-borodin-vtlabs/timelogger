class Project < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	has_many :intervals, through: :tasks
	validates_presence_of :title
end
