When(/^I open the root page$/) do
  visit("/")
end

Then(/^I expect to( not)? see a link to the root page$/) do |notAllowed|
  base_path_links = all(:xpath, "//a[href='#{base_path}']").size
  root_path_links = all(:xpath, "//a[href='./index.html']").size
  assert(notAllowed.present? ^ (base_path_links + root_path_links > 0))
end

Then(/^I expect to see the header "(.*?)"$/) do |header_text|
  header = find("h1")
  assert(header.text == header_text)
end