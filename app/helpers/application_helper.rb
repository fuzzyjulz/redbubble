module ApplicationHelper
  def self.works_xml
    Nokogiri::XML(File.open(source_data_file))
  end
  
  def self.source_data_file()
    Rails.configuration.source_data_file
  end
  
  def self.source_data_file=(file_location)
    Rails.configuration.source_data_file = file_location
  end
end
