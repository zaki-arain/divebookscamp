class Schedule < ApplicationRecord

has_many :selections
has_many :users, through: :selections
has_many :tasks, through: :selections

end
