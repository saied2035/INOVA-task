# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

for i in 0..999 do
   User.create(username: Faker::Name.unique.name)
end

User.all.each do |user|
    for i in 0..49 do
        Story.create(title: Faker::Lorem.unique.sentence,
        body: Faker::Lorem.unique.paragraph(random_sentences_to_add: 10),
        user: user
        )
    end
end

Story.all.each do |story|
      for i in 0..2 do
         Review.create(rate: rand(0..5), comment: Faker::Lorem.unique.sentence, story: story)
      end  
end    