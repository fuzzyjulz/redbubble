When(/^I open the model "(.*?)" for the make "(.*?)"$/) do |model_name, make_name|
  open_model_page(make_name, model_name)
end


def open_model_page(make_name, model_name)
  open_root_page
  within ("nav") { click_on make_name }
  within ("nav") { click_on model_name }
  puts "Current Page: "+page.current_url
end
