class Project < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	has_many :intervals, through: :tasks
	belongs_to :user
	validates_presence_of :title, :user_id
end
