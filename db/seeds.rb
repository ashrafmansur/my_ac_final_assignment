require 'faker'

20.times do
  username = Faker::Internet.user_name
  email =    Faker::Internet.email
  password = 123456
  User.create(username: username, email: email, password: password)
end

for i in (1..20)
  body = Faker::Friends.quote
  Note.create(body: body, user: User.find(i))
end
