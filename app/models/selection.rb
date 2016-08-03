class Selection < ApplicationRecord
	belongs_to :schedule
	belongs_to :user
	belongs_to :task
	# has_one :group, through: :task
end