class CreatePosts < ActiveRecord::Migration
  create_table :posts do |t|
    t.references :user, index: true, foreign_key: true
    t.string :url
    t.string :title
    t.text :description
    t.timestamps null: false
  end
end