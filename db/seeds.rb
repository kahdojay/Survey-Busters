require 'faker'

# seed entries
10.times do
  Entry.create(
    title: Faker::Lorem.sentence,
    post: Faker::Lorem.paragraph,
    user_id: 1+rand(10)
     )
end

# seed tags

10.times do
  Tag.create(
    tag_name: Faker::Lorem.word
    )
end


# seed entry_tags

entries = Entry.all
entries.each do |entry|
  (10..1).each do |num|
    entry.user_id = num
  end
  5.times do
    EntryTag.create(entry_id: entry.id, tag_id: rand(10) + 1 )
  end
end

10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )
end
