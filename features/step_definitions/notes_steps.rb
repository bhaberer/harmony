Given /^the following notes:$/ do |notes|
  Notes.create!(notes.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) notes$/ do |pos|
  visit notes_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following notes:$/ do |expected_notes_table|
  expected_notes_table.diff!(tableish('table tr', 'td,th'))
end
