class Task < ApplicationRecord
	has_many :selections
	belongs_to :day
	belongs_to :group
end