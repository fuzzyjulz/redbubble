Feature: Test Make model

Scenario: Test all make methods
  When I check make::all
  When I check make::find
   And I check make.works
   And I check make.models
