include ApplicationHelper

# def valid_signin(user)
# 	fill_in "Email", 		with: user.email
# 	fill_in "Password", with: user.password
# 	click_button submit
# end

def sign_in(user)
	visit signin_path
	fill_in "Email", 	with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"
	# Sign in when not using Capybara as well.
	cookies[:remember_token] = user.remember_token
end

def create_valid_user
	fill_in "Name", 				with: "Example User"
	fill_in "Email", 				with: "user@example.com"
	fill_in "Password", 		with: "foobar"
	fill_in "Confirmation", with: "foobar"
end

def update_user_info(new_name, new_email)
	fill_in "Name", 						with: new_name
	fill_in "Email", 						with: new_email
	fill_in "Password", 				with: user.password
	fill_in "Confirm Password", with: user.password
	click_button "Save changes"
end

def find_user_by_email(user_email)
	User.find_by(email: user_email)
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.alert-error', text: message)
	end
end

RSpec::Matchers.define :have_success_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.alert-success', text: message)
	end
end