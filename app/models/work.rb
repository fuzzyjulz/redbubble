class Work
  def initialize(work_xml)
    @work_xml = work_xml
  end
  
  def thumbnail
    @work_xml.xpath("urls/url[@type = 'small']").text
  end
  
  def make_id
    Make.get_id_for_name(@work_xml.xpath("exif/make").text)
  end
  
  def model_id
    Model.get_id_for_name(@work_xml.xpath("exif/model").text)
  end

  def self.all
    ApplicationHelper.works_xml.xpath("/works/work").map {|work| Work.new(work)}
  end
end