Then(/^my location should be established$/) do
  coords = page.evaluate_script('map.getCenter();')
  expect(coords['lat'].round(4)).to eq 57.7089
  expect(coords['lng'].round(4)).to eq 11.9800
end
