class Task < ApplicationRecord
	has_many :selections
	belongs_to :day
	belongs_to :group
	has_one :user, through: :selections
	has_one :schedule, through: :selections
end