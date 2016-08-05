# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Day.destroy_all
Group.destroy_all
Schedule.destroy_all
Task.destroy_all

10.times do
    User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Name.first_name + "@divebookscamp.com",
      password: "password"
    )
end
User.create(first_name: "Adam", last_name: "Baxter", email: "adam@divebookscamp.com", password: "1234")

3.times do
    Day.create(name: "Monday")
    Day.create(name: "Tuesday")
    Day.create(name: "Wednesday")
    Day.create(name: "Thursday")
    Day.create(name: "Friday")
end

Group.create(name: "Group 1")
Group.create(name: "Group 2")
Group.create(name: "Group 3")
Group.create(name: "Runner")
Group.create(name: "Maintenance")
Group.create(name: "Vacation")

Schedule.create(start_date: "2016-08-04")


Group.all.map do |group|
  Day.all.first(5).map do |day|
    Task.create!(
    day_id: day.id,
    group_id: group.id,
    theme: Faker::Hacker.noun,
    activity: Faker::Hacker.verb,
    )
  end
end

Group.all.map do |group|
  Day.all.offset(5).first(5).map do |day|
    Task.create!(
    day_id: day.id,
    group_id: group.id,
    theme: Faker::Hacker.noun,
    activity: Faker::Hacker.verb,
    )
  end
end

Group.all.map do |group|
  Day.all.offset(10).first(5).map do |day|
    Task.create!(
    day_id: day.id,
    group_id: group.id,
    theme: Faker::Hacker.noun,
    activity: Faker::Hacker.verb,
    )
  end
end

Task.all.each do |task|
  User.all.each do |user|
  15.times do
      Selection.create(
        schedule_id: 1,
        user_id: user.id,
        task_id: task.id
      )
    end
    end
end
#
# 25.times do
#     Selection.create(
#       schedule_id: Schedule.first.id,
#       user_id: User.all.shuffle[0].id,
#       task_id: Task.all.shuffle[0].id
#     )
# end
