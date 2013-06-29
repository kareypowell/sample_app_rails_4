namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do

		# Creating the first user to me the owner
		admin = User.create!(name: "Karey Powell",
								 				 email: "kareyp9@gmail.com",
								  			 password: "foobar",
												 password_confirmation: "foobar",
												 admin: true)

		# Create 99 other fake users
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(name: name,
									 email: email,
									 password: password,
									 password_confirmation: password)
		end

		# Create a bunch of fake microposts for the first 10 users
		users = User.all(limit: 6)
		50.times do
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.microposts.create!(content: content) }
		end
	end
end