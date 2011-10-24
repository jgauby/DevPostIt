Fabricator(:post_it) do
  title    { Faker::Lorem.sentence }
  content  { Faker::Lorem.paragraph }
  username { Faker::Name.name }
  email    { Faker::Internet.email }
  
  language!
end