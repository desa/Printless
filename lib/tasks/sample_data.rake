namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    me = User.create!(name: "Michael Desa",
                 email: "mjdesa@gmail.com",
                 password: "teamCa1",
                 password_confirmation: "teamCa1")
    me.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 6)
    50.times do
      title = Faker::Lorem.words(2)
      content = Faker::Lorem.paragraph
      users.each { |user| user.articles.create!(title: title, content: content) }
    end     
    50.times do
      title = Faker::Lorem.words(2)
      content = Faker::Lorem.sentence(5)
      money_wanted = 100
      users.each { |user| user.projects.create!(title: title, content: content,
        money_wanted: money_wanted) }
    end
  end
end