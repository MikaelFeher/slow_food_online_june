Given(/^the following restaurant exists$/) do |table|
  table.hashes.each do |restaurant|
    FactoryGirl.create(:restaurant, id: restaurant[:id],
                                  name: restaurant[:name],
                                  address: restaurant[:address],
                                  zip_code: restaurant[:zip_code])
  end
end

Given(/^I am on the "([^"]*)" page for "([^"]*)"$/) do |page, name|
  restaurant = Restaurant.find_by(name: name)
  visit edit_restaurant_path(restaurant)
end
