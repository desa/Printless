# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120328094158) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "content"
  end

  add_index "articles", ["user_id", "created_at"], :name => "index_articles_on_user_id_and_created_at"

  create_table "comments", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "content"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.string   "commentable_type"
  end

  create_table "donations", :force => true do |t|
    t.integer  "donator_id"
    t.integer  "donatee_id"
    t.datetime "charged_at"
    t.integer  "amount"
    t.string   "donatable_type"
    t.integer  "donatable_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "invitation_lists", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "journalist"
  end

  add_index "invitation_lists", ["email"], :name => "index_invitation_lists_on_email"

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "money_wanted"
    t.integer  "money_earned"
    t.string   "subject"
    t.datetime "finish_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "expenses"
    t.text     "content"
  end

  add_index "projects", ["user_id", "created_at"], :name => "index_projects_on_writer_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "journalist"
    t.string   "twitter_id"
    t.string   "interests"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.text     "about_me"
    t.string   "image"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
