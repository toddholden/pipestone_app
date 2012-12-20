namespace :db do
  desc "Fill animals table with sample data"

  re = /\A\d{2}[a-zA-Z]{3}\d{4}\z/
  task populate: :environment do
    admin = User.create!(name: "Ted",
                 email: "ted@foo.bar",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    Animal.create!(date: Time.now,
                 metal1:"41AAA1234",
                 allflex: "23563274",
                 comments: "Lorem ipsum")
                 
    50.times do |n|
      date = rand(2.years).ago 
      metal1 = Faker::Base.regexify(/^[1-9][0-9][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]$/)
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
      email = Faker::Internet.email
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    50.times do |n|
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
