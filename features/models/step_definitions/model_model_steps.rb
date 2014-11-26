When(/^I check model::all$/) do
  all_models = [  "NIKON D80",  
                  "Canon EOS 20D",  
                  "FinePix S6500fd",  
                  "D-LUX 3",  
                  "SLP1000SE",  
                  "DMC-FZ30",  
                  "Canon EOS 400D DIGITAL"
                  ]
  assert(Model.all.size == all_models.size)
  Model.all.each do |model|
    all_models.include?(model.name)
  end
end

When(/^I check model::find$/) do
  assert(Model.find("unknown","camera").nil?)
  assert(Model.find("Canon","nikon-d80").nil?)
  assert(Model.find("NIKON CORPORATION","nikon-d80").nil?)
  assert(Model.find("nikon-corporation","NIKON D80").nil?)
  assert(Model.find("nikon-corporation","nikon-d80").name == "NIKON D80")
  assert(Model.find("","").nil?)
end

When(/^I check model\.make$/) do
  assert(Model.find("nikon-corporation","nikon-d80").make.name == "Nikon Corporation")
  assert(Model.find("leica","d-lux-3").make.name == "Leica")
end

When(/^I check model\.works$/) do
  expected_work_id = [31820]
  work_id = Model.find("nikon-corporation","nikon-d80").works.map {|work| work.id}
  assert(expected_work_id == work_id, "Expected #{expected_work_id} found #{work_id}")
    
  expected_work_id = [2729606, 3201430, 3502552, 512919, 4250369]
  work_id = Model.find("leica","d-lux-3").works.map {|work| work.id}
  assert(expected_work_id == work_id, "Expected #{expected_work_id} found #{work_id}")

  expected_work_id = [2041]
  work_id = Model.find("canon","canon-eos-20d").works.map {|work| work.id}
  assert(expected_work_id == work_id, "Expected #{expected_work_id} found #{work_id}")
end