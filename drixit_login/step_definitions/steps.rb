Given(/^(.*) user enters to the Drixit site$/) do |user|
  @app = DrixitApp.new
  @text = @app.data.text[:en]
  @app.home.load
  expect(@app.home.validate_page).to eq(@text[:home])
end

When(/^portal user logs in to the Drixit site with valid credentials$/) do
  @app.home.top_nav.sign_in
  expect(@app.login.validate_page).to eq(@text[:login].except(:error))
  @user_test_data = @app.data.existing_user
  @app.login.authenticate_user(@user_test_data)
end

Then(/^portal user successfully logged in to the Drixit site$/) do
  @profile_validations = @app.my_open_jobs.validate_page
  expect(@profile_validations[:title]).to eq("#{@text[:profile][:welcome]} #{@user_test_data[:first_name]}")
  expect(@profile_validations[:contact_info][:email]).to eq(@user_test_data[:email])
  expect(@profile_validations[:contact_info][:telephone]).to eq(@user_test_data[:telephone])
  location = "#{@user_test_data[:location][:street]}, #{@user_test_data[:location][:city]}, #{@user_test_data[:location][:state]}, #{@user_test_data[:location][:country]}, #{@user_test_data[:location][:zip]}"
  expect(@profile_validations[:contact_info][:location]).to eq(location)
end

When(/^anonymous user logs in to the Drixit site with invalid credentials$/) do
  @app.home.top_nav.sign_in
  expect(@app.login.validate_page).to eq(@text[:login].except(:error))
  @user_test_data = @app.data.non_existing_user
  @app.login.authenticate_user(@user_test_data)
  @app.login.wait_until_login_error_paragraph_visible
end

Then(/^anonymous user was unable to log in to the Drixit site$/) do
  expect(@app.login.login_error_paragraph.text.downcase).to eq(@text[:login][:error])
end

When(/^portal user attempts to reset my password through the Drixit site$/) do
  @app.home.top_nav.sign_in
  expect(@app.login.validate_page).to eq(@text[:login].except(:error))
  @user_test_data = @app.data.reset_password_user
  @app.login.reset_password_link.click
  expect(@app.reset_password.validate_page).to eq(@text[:reset_password].except(:error))
  @app.reset_password.reset_user_password(@user_test_data)
end

Then(/^portal user successfully triggered the reset password process through the Drixit site$/) do
  expect(@app.reset_password.get_reset_password_message).to eq(@text[:reset_password][:error])
end

