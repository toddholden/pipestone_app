namespace :db do
  desc "Fill animals table with sample data"

  task populate: :environment do
    admin1 = User.create!(name: "Ted",
                 email: "ted@foo.bar",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin1.toggle!(:admin)
    admin2 = User.create!(name: "Ray Scheierl",
                 email: "ray.scheierl@state.mn.us",
                 password: "Scheierl",
                 password_confirmation: "Scheierl")
    admin2.toggle!(:admin)
                 
    50.times do |n|
      date = rand(2.years).ago.to_s("%m/%d/%y")
      metal1 = Faker::Base.regexify(/^[1-9][0-9][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]$/)
      allflex = Faker::Base.regexify(/^(MN|WI|SD)[0-9]{5}$/)
      comment = Faker::Lorem.sentence(word_count = 4, supplemental = false) 
      breed = Faker::Base.regexify(/^[A-Z]{3}$/)
      sex = Faker::Base.regexify(/^(M|F)$/)
      age = Faker::Base.regexify(/^[1-9](m|y)$/)
      old_tag = Faker::Base.regexify(/^[A-Z][0-9]{3}$/)
      owner = Faker::Base.regexify(/^[1-4]?\d$/)
      Animal.create!(date: date,
                   metal1: metal1,
                   allflex: allflex,
                   comments: comment,
                   breed: breed,
                   sex: sex,
                   age: age,
                   person_id: owner,
                   old_tag: old_tag)
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
      zipcode = Faker::Address.zip_code
      Person.create!(lastname: lastname,
                     firstname: firstname,
                     address: address,
                     city: city,
                     state: state,
                     zipcode: zipcode)
    end
  end
end
