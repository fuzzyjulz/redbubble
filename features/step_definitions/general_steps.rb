When(/^I open the root page$/) do
  open_root_page
end

Then(/^I expect to( not)? see a link to the root page$/) do |notAllowed|
  root_path_links = all(:xpath, "//a[contains(@href,'/index.html')]").size
  assert(notAllowed.present? ^ (root_path_links > 0))
end

Then(/^I expect to see the header "(.*?)"$/) do |header_text|
  header = find("h1")
  assert(header.text == header_text)
end

Then(/^I expect to see only the given items in the navigation$/) do |table|
  each_list_item(table) do |item_name|
    assert(all("nav a[text()='#{item_name}']").size > 0, "Couldn't find '#{item_name}' on the page.")
  end
  assert(all("nav a").size == table.cell_matrix.size, "More nav items than were described were found(found:#{all("nav a").size}, expected:#{table.cell_matrix.size})")
end

module GeneralHelpers
  def open_root_page
    visit("/")
  end
  def each_list_item(list, &block)
    list.cell_matrix.each do |row|
      block.call row[0].value
    end
  end
end

World(GeneralHelpers)