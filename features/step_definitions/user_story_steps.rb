Given /^a user story titled "(.*?)"$/ do |title|
  FactoryGirl.create :story, title: title
end

Given /^there (?:is|are) (-?\d+) user stor(?:ies|y)$/ do |n|
  FactoryGirl.create_list :story, n
end

When /^I go to the user stories page$/ do
  visit '/stories'
end

When /^I go to (user story ".*?")$/ do |story|
  visit "/stories/#{story.to_param}"
end

When /^I open the first user story$/ do
  page.all('.summary_story > h3 > a').first.click
end

When /^I go to create a new user story$/ do
  visit '/stories'
  click_link 'Write new user story'
end

When /^I create a valid user story$/ do
  attributes = FactoryGirl.attributes_for :story
  fill_in 'story_title', with: attributes.fetch(:title)
  fill_in 'story_body', with: attributes.fetch(:body)
  click_button 'Create Story'
end

When /^I create an invalid user story$/ do
  fill_in 'story_title', with: ''
  click_button 'Create Story'
end

When /^I edit (user story ".*?"):$/ do |story, table|
  visit "/stories/#{story.to_param}/edit"
  table.rows_hash.each do |attr, value|
    fill_in attr, with: value
  end
  click_button 'Update Story'
end

Then /^I should see the full user story$/ do
  expect(page).to have_css('.story', count: 1)
end

Then /^I should see (-?\d+) user stor(?:ies|y)$/ do |n|
  expect(page).to have_css('.summary_story', count: n)
end