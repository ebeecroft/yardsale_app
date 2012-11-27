namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_user_address
    make_yardsales
    make_yardsale_address
    # make_categories
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "user@mail.com",
                       password: "yardsale",
                       password_confirmation: "yardsale")
  admin.toggle!(:admin)
  10.times do |n|
    name  = Faker::Name.name
    email = "user-#{n+1}@mail.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_user_address
  users = User.all
  1.times do
    street = Faker::Address.street_address(false)
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip_code
    users.each { |user| Address.create!(user_id: user.id,
                                        street: street,
                                        city: city,
                                        state: state,
                                        zip_code: zip_code) }
  end
end

def make_yardsales
  users = User.all
  5.times do
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

def make_yardsale_address
  yardsales = Yardsale.all
  1.times do
    street = Faker::Address.street_address(false)
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip_code
    yardsales.each { |yardsale| Address.create!(yardsale_id: yardsale.id,
                                        street: street,
                                        city: city,
                                        state: state,
                                        zip_code: zip_code) }
  end
end

# def make_categories
#   10.times do |n|
#     name  = Faker::Lorem.word
#     Category.create!(name: name)
#   end
# end

# def make_relationships
#   users = User.all
#   user  = users.first
#   yardsales = Yardsale.all
#   yardsale  = yardsales.first
#   followed_yardsales = yardsales[2..5]
#   followers          = users[3..40]
#   followed_yardsales.each { |followed| user.follow!(followed) }
#   followers.each      { |follower| follower.follow!(yardsale) }
# end



def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end