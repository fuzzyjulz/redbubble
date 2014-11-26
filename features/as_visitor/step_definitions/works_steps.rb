Then(/^I expect to see (\d+) works images$/) do |num|
  worksImages = all(".workImage").size
  assert(worksImages == num.to_i, "Found #{worksImages} works, expected #{num}")
end

Then(/^I expect to see the given works images$/) do |table|
  each_list_item(table) do |work_image_url|
    assert(all("img.workImage[@src='#{work_image_url}']").size > 0, "Couldn't find '#{work_image_url}' on the page.")
  end
end