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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150514192110) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",           default: false
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "answers", force: true do |t|
    t.text     "body"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["slug"], name: "index_answers_on_slug"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "domain"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  add_index "articles", ["event_id"], name: "index_articles_on_event_id"

  create_table "bootsy_image_galleries", force: true do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: true do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "comment_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["comment_id"], name: "index_categorizations_on_comment_id"
  add_index "categorizations", ["event_id"], name: "index_categorizations_on_event_id"

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comment_id"
    t.integer  "questions_count",    default: 0
    t.string   "image_uid"
    t.integer  "cached_votes_total", default: 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
    t.text     "about"
    t.boolean  "active"
    t.string   "link"
    t.text     "info"
    t.boolean  "published",          default: false
    t.integer  "position"
    t.string   "video_url"
    t.string   "tweet"
    t.string   "quote_author"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["slug"], name: "index_comments_on_slug"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "domain"
    t.integer  "post_id"
    t.string   "slug"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "events", ["post_id"], name: "index_events_on_post_id"
  add_index "events", ["slug"], name: "index_events_on_slug"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "links", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "URL"
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "description"
    t.integer  "cached_votes_total", default: 0
    t.integer  "question_id"
  end

  add_index "links", ["post_id"], name: "index_links_on_post_id"
  add_index "links", ["question_id"], name: "index_links_on_question_id"
  add_index "links", ["user_id"], name: "index_links_on_user_id"

  create_table "pictures", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "description"
    t.string   "image_remote_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["post_id"], name: "index_pictures_on_post_id"

  create_table "posts", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_remote_url"
    t.string   "country"
    t.string   "title"
    t.integer  "cached_votes_total", default: 0
    t.string   "slug"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "distance"
    t.integer  "comments_count",     default: 0
    t.string   "link"
    t.string   "domain"
    t.boolean  "hide",               default: false
    t.boolean  "top",                default: false
    t.boolean  "category",           default: false
    t.integer  "position"
    t.boolean  "event",              default: false
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "questions", force: true do |t|
    t.text     "body"
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "cached_votes_total", default: 0
    t.string   "image_remote_url"
    t.string   "caption"
    t.string   "slug"
    t.integer  "answers_count",      default: 0
    t.boolean  "anon"
    t.boolean  "hide",               default: false
    t.boolean  "recommend",          default: false
    t.integer  "position"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "alt",                default: ""
    t.string   "hint",               default: ""
  end

  add_index "questions", ["comment_id"], name: "index_questions_on_comment_id"
  add_index "questions", ["slug"], name: "index_questions_on_slug"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "rich_rich_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        default: "file"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "texts", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "texts", ["post_id"], name: "index_texts_on_post_id"
  add_index "texts", ["user_id"], name: "index_texts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "place"
    t.string   "image_uid"
    t.string   "age"
    t.string   "twitter"
    t.string   "slug"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug"

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
