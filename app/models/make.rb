#A Camera make used to capture a piece of artwork. 
#  Makes are extracted from the works xml, but could be stored in a database and use ActiveRecord to
#  be extracted at a later date
class Make
  attr_reader :name, :id
  
  def to_param
      id
  end
  
  def initialize(id, make)
    @id = id
    @name = make
  end
  
  def works
    Work.all.select {|work| work.make_id == id}
  end
  
  def models
    Model.all.select {|model| model.make_id == id}
  end
  
  def self.find(id)
    all.each do |item|
      return item if item.id == id
    end
    return nil
  end

  def self.all
    ApplicationHelper.works_xml.xpath("/works/work/exif/make").map{|make| make.text.titleize}.uniq.
      map {|make| Make.new(get_id_for_name(make), make)}
  end
  
  #For a given make name, the id used by the system is returned
  def self.get_id_for_name(make_name)
    make_name.parameterize
  end
end