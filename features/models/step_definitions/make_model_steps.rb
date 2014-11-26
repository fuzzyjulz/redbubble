When(/^I check make::all$/) do
  all_makes = [  "Nikon Corporation",  
                  "Canon",  
                  "Fujifilm",  
                  "Leica",  
                  "Fuji Photo Film Co., Ltd.",  
                  "Panasonic"
                  ]
  assert(Make.all.map{|make| make.name} == all_makes)
end

When(/^I check make::find$/) do
  assert(Make.find("unknown").nil?)
  assert(Make.find("Canon").nil?)
  assert(Make.find("canon").name == "Canon")
  assert(Make.find("NIKON CORPORATION").nil?)
  assert(Make.find("nikon-corporation").name == "Nikon Corporation")
  assert(Make.find("").nil?)
end

When(/^I check make\.works$/) do
  expected_work_id = [31820]
  work_id = Make.find("nikon-corporation").works.map {|work| work.id}
  assert(expected_work_id == work_id, "Expected #{expected_work_id} found #{work_id}")

  expected_work_id = [2729606, 3201430, 3502552, 512919, 4250369]
  work_id = Make.find("leica").works.map {|work| work.id}
  assert(expected_work_id == work_id, "Expected #{expected_work_id} found #{work_id}")

  expected_work_id = [2041, 777577]
  work_id = Make.find("canon").works.map {|work| work.id}
  assert(expected_work_id == work_id, "Expected #{expected_work_id} found #{work_id}")
end

When(/^I check make\.models$/) do
  expected_model_names = ["Canon EOS 20D", "Canon EOS 400D DIGITAL"]
  model_names = Make.find("canon").models.map {|model| model.name}
  assert(expected_model_names == model_names, "Expected #{expected_model_names} found #{model_names}")

  expected_model_names = ["D-LUX 3"]
  model_names = Make.find("leica").models.map {|model| model.name}
  assert(expected_model_names == model_names, "Expected #{expected_model_names} found #{model_names}")
end