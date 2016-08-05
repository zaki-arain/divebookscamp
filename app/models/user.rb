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

	def percent_time_in(schedule, group_id)
		user_selections = self.selections.where(schedule_id: schedule.id)
		occurences_of_group_selections = user_selections.select { |selection| selection.group.id == group_id}
		return (occurences_of_group_selections.count / 15.0 * 100).round(1)
	end

	def total_days_off
		user_selections = self.selections
		days_off = user_selections.select {|selection| selection.group.id == 6}
		return days_off.count
	end

end
