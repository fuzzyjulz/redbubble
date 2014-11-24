module ApplicationHelper
  def self.works_xml
    Nokogiri::XML(File.open("data/works.xml"))
  end
end
