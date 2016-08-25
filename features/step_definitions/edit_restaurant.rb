Given(/^the following restaurant exists$/) do |table|
  table.hashes.each do |restaurant|
    FactoryGirl.create(:restaurant, restaurant)
  end
end

Given(/^I am on the "([^"]*)" page for "([^"]*)"$/) do |page, name|
  restaurant = Restaurant.find_by(name: name)
  visit edit_restaurant_path(restaurant)
end

Then(/^I should be on the "([^"]*)" page for "([^"]*)"$/) do |page, name|
  restaurant = Restaurant.find_by(name: name)
  visit edit_restaurant_path(restaurant)
end
