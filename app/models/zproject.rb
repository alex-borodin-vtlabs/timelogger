class Zproject < ActiveRecord::Base
	validates :name, presence: true
	has_many :ztask
end
