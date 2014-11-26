Feature: Test Model model

Scenario: Test all model methods
  When I check model::all
  When I check model::find
   And I check model.make
   And I check model.works
