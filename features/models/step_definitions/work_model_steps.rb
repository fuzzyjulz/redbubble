When(/^I check work::all$/) do
  work_ids = [  31820,  
                2041, 
                240509,  
                26583,  
                2729606,  
                2828069,  
                3201430,  
                3502552,  
                3745978,  
                3775226,  
                512919, 
                4250369,  
                777577,  
                867035]

  all = Work.all
  assert(all.size == work_ids.size)
  all.each do |work|
    assert(work_ids.include?(work.id), "Couldn't find work id #{work.id}")
  end
end

When(/^I check work\.thumbnail$/) do
  assert(get_work_obj_by_id(31820).thumbnail == "http://ih1.redbubble.net/work.31820.1.flat,135x135,075,f.jpg")
end

When(/^I check work\.make_id$/) do
  assert(!get_work_obj_by_id(26583).make_id.present?)
  assert(get_work_obj_by_id(2041).make_id == "canon")
end

When(/^I check work\.model_id$/) do
  assert(!get_work_obj_by_id(26583).model_id.present?)
  assert(get_work_obj_by_id(2041).model_id == "canon-eos-20d")
end

module WorkDataHelper
  def get_work_obj_by_id(id)
    Work.all.select {|work| work.id == id}.first
  end
end

World(WorkDataHelper)