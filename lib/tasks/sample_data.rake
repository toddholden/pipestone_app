namespace :db do
  desc "Fill animals table with sample data"
  task populate: :environment do
    admin = User.create!(name: "Ted",
                 email: "ted@foo.bar",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    Animal.create!(date: "2012/10/24",
                 metal1:"123456",
                 allflex: "23563274",
                 comments: "Lorem ipsum")
                 
    200.times do |n|
      date = "2012/10/24"
      metal1 = "#{n+1}"
      allflex = "#{n+2}"
      comment = Faker::Lorem.sentence(10) 
      Animal.create!(date: date,
                   metal1: metal1,
                   allflex: allflex,
                   comments: comment
                   )
    end

    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@foo.bar"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    20.times do |n|
      lastname = Faker::Name.last_name
      firstname = Faker::Name.first_name
      address = Faker::Address.street_address(include_secondary = false)
      city = Faker::Address.city
      state = "MN"
      Person.create!(lastname: lastname,
                     firstname: firstname,
                     address: address,
                     city: city,
                     state: state)
    end
  end
end
