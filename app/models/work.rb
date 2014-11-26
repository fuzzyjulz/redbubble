#A piece of artwork. All data is lazily loaded from the xml.
class Work
  def initialize(work_xml)
    @work_xml = work_xml
  end
  
  #Returns the id of this Work
  def id
    @work_xml.xpath("id").text.to_i
  end

  #Returns the URL for the thumbnail image for this work
  def thumbnail
    @work_xml.xpath("urls/url[@type = 'small']").text
  end
  
  #Returns the id of the Make in this work
  def make_id
    Make.get_id_for_name(@work_xml.xpath("exif/make").text)
  end
  
  #Returns the id of the Model for this work
  def model_id
    Model.get_id_for_name(@work_xml.xpath("exif/model").text)
  end

  #Lists all works in the datastore
  def self.all
    ApplicationHelper.works_xml.xpath("/works/work").map {|work| Work.new(work)}
  end
end