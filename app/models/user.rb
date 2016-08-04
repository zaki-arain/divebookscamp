class User < ApplicationRecord
	has_many :selections
	has_many :schedules, through: :selections
	has_many :tasks, through: :selections
	has_many :groups, through: :tasks
  has_many :drafters
  has_secure_password

end
