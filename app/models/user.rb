class User < ApplicationRecord
	has_many :selections
	has_many :schedules, through: :selections
	has_many :tasks, through: :selections
	has_many :groups, through: :tasks
  has_many :drafters
  has_secure_password

	validates :email, format: { with: /\b+@divebookscamp\.com\z/,
                  message: "must be a valid Dive Books Camp account" }
	validates_uniqueness_of :email

	def ordered_choices(schedule)
	  user_selections = self.selections.where(schedule_id: schedule.id)
		ordered_selections = user_selections.map {|sel| sel}.sort {|a, b| a.day.id <=> b.day.id}
		return ordered_selections
	end
	
end
