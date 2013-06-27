FactoryGirl.define do
	factory :user do
		name			"Karey Powell"
		email			"karey@example.com"
		password	"foobar"
		password_confirmation "foobar"
	end
end