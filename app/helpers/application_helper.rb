module ApplicationHelper
  #Returns the works xml file ready for processing
  def self.works_xml
    Nokogiri::XML(File.open(source_data_file))
  end
  
  #Returns the data source file name
  def self.source_data_file()
    Rails.configuration.source_data_file
  end
  
  #Sets the data source file name
  def self.source_data_file=(file_location)
    Rails.configuration.source_data_file = file_location
  end
end
