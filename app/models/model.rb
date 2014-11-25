#A Camera model used to capture a piece of artwork. 
#  Models are extracted from the works xml, but could be stored in a database and use ActiveRecord to
#  be extracted at a later date
class Model
  attr_reader :id, :name, :make_id
  
  def initialize(id, name, make_id)
    @id = id
    @name = name
    @make_id = make_id
  end
  
  def to_param
      id
  end
  
  def works
    Work.all.select {|work| work.model_id == id}
  end

  def make
    Make.find(make_id)
  end

  def self.find(make_id, model_id)
    all.each do |item|
      return item if item.make_id == make_id && item.id == model_id
    end
    return nil
  end

  def self.all
    model_names = []
    models = []
    ApplicationHelper.works_xml.xpath("/works/work/exif/model").each do |model|
      make_name = model.parent.xpath("make").text
      model_name = model.text
      make_model_name = "#{make_name}## #{model_name}"
      
      next if model_names.include?(make_model_name)

      model_names << make_model_name
      models << Model.new(get_id_for_name(model_name), model.text, Make.get_id_for_name(make_name))
    end
    models
  end

  #For a given model name, the id used by the system is returned
  def self.get_id_for_name(model_name)
    model_name.parameterize
  end
end