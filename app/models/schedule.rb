class Schedule < ApplicationRecord
  has_many :selections
  has_many :users, through: :selections
  has_many :tasks, through: :selections
  has_many :drafters

  def find_selection(args)
    self.selections.select { |selection| selection.day.id == args[:day_id] && selection.group.id == args[:group_id]}
  end
end
