Given /^the following generals:$/ do |generals|
  General.create!(generals.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) general$/ do |pos|
  visit generals_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following generals:$/ do |expected_generals_table|
  expected_generals_table.diff!(tableish('table tr', 'td,th'))
end
