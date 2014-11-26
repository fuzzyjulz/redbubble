When(/^I open the make "(.*?)"$/) do |make_name|
  open_make_page(make_name)
end

module MakeHelpers
  def open_make_page(make_name)
    open_root_page
    within ("nav") { click_on make_name }
    puts "Current Page: "+page.current_url
  end
end

World(MakeHelpers)