Feature: Test Work model

Scenario: Test all Work methods
  When I check work::all
   And I check work.thumbnail
   And I check work.make_id
   And I check work.model_id