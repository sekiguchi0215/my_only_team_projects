# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

%w[texts movies].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

CSV.foreach("db/csv_data/text_data.csv", headers: true) do |row|
  Text.create(
    genre: row["genre"],
    title: row["title"],
    content: row["content"]
  )
end
puts "テキスト教材データの投入に成功しました。"

CSV.foreach("db/csv_data/movie_data.csv", headers: true) do |row|
  Movie.create(
    genre: row["genre"],
    title: row["title"],
    url: row["url"]
  )
end
puts "動画教材データの投入に成功しました。"

email = "test@example.com"
password = "password"

User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end
