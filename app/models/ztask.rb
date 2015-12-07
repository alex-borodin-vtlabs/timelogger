class Ztask < ActiveRecord::Base
	validates :name, presence: true
	has_many :zinterval
	belongs_to :zproject
end
