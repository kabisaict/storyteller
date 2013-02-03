Given /^I have an account with "(.*?)"$/ do |email|
  FactoryGirl.create :user, :confirmed, email: email
end

When /^I use an outdated token to reset my password$/ do
  visit '/users/password/edit?reset_password_token=foobar'
end

When /^I enter "(.*?)" as my new password$/ do |password|
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password
  click_button 'Change my password'
end

When /^I request a new password for "(.*?)"$/ do |email|
  visit '/users/sign_in'
  click_link 'Forgot your password?'
  fill_in 'user_email', with: email
  click_button 'Send me reset password instructions'
end

When /^I create an account with "(.*?)" and "(.*?)"$/ do |email, password|
  visit '/'
  click_link 'Sign up'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password
  click_button 'Sign up'
end

When /^I sign out$/ do
  page.driver.submit :delete, '/users/sign_out', {}
end

When /^I sign in with "(.*?)" and "(.*?)"$/ do |email, password|
  visit '/users/sign_in'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button 'Sign in'
end