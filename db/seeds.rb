require 'faker'

user = User.create({email: 'maria.baltabaeva@gmail.com', password: 'password', confirmed_at: Time.now})
user = User.last

15.times do
  RegisteredApplication.create!(
    name: Faker::Space.planet,
    url: Faker::String.random ,
    user: user
  )
end
registered_applications = RegisteredApplication.all

30.times do
  Event.create!(
    name: Faker::Space.moon,
    registered_application: registered_applications.sample
  )
  events = Event.all

end
puts "Seed finished"
puts "#{RegisteredApplication.count} apps created"
puts "#{Event.count} events created"
