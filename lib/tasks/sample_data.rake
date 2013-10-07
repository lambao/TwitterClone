namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 displayName: "lambao",
                 email: "123@123.com",
                 password: "123",
                 password_confirmation: "123")
    99.times do |n|
      name  = "Name no #{n+1}"
      displayName  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "123"
      User.create!(name: name,
                   displayName: displayName,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end