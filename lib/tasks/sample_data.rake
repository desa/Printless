namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_articles
    make_projects
    make_relationships
    make_article_comments
    make_project_comments
  end
end

def make_users
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
end
    
def make_articles
    users = User.all(limit: 6)
    50.times do
      title = Faker::Lorem.words(2)
      content = Faker::Lorem.paragraphs(2)
      users.each { |user| user.articles.create!(title: title, content: content) }
    end
end

def make_projects 
  users = User.all(limit: 6)
  50.times do
    title = Faker::Lorem.words(2)
    content = Faker::Lorem.sentences(5)
    money_wanted = 100
    users.each do|user|
      user.projects.create!(title: title, content: content,
      money_wanted: money_wanted)
    end
  end
end
  
def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_article_comments
  users = User.all(limit: 6)
  articles = Article.all
  users.each do |user|
    articles.each do |article|
      user_id = user.id
      content = Faker::Lorem.sentences(5)
      article.comments.create!(content: content, user_id: user_id)
    end
  end
end

def make_project_comments
  users = User.all(limit: 6)
  projects = Project.all
  users.each do |user|
    projects.each do |project|
      user_id = user.id
      content = Faker::Lorem.sentences(5)
      project.comments.create!(content: content, user_id: user_id)
    end
  end
end