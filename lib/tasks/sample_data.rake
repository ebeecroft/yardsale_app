namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_address
    make_yardsales
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "user@mail.com",
                       password: "yardsale",
                       password_confirmation: "yardsale")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "user-#{n+1}@mail.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_address
  users = User.all(limit: 6)
  1.times do
    title = Faker::Lorem.sentence(3)
    city = Faker::Lorem.sentence(1)
    state = Faker::Lorem.sentence(1)
    zip_code = "00000"
    users.each { |user| user.address.create!(street: street,
                                             city: city,
                                             state: state,
                                             zip_code: zip_code) }
  end
end

def make_yardsales
  users = User.all(limit: 6)
  50.times do
    title = Faker::Lorem.sentence(5)
    date = "22 Oct 2012"
    begin_time = "10"
    end_time = "11"
    description = Faker::Lorem.paragraph(5)
    users.each { |user| user.yardsales.create!(title: title,
                                               date: date,
                                               begin_time: begin_time,
                                               end_time: end_time,
                                               description: description) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end