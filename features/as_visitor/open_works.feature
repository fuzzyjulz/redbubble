Feature: Open Works
  In order to view the works in the system
  A visitor
  Should be able to view the index page
  
Scenario: Visitor can access works page
  When I open the root page
  Then I expect to see 10 works images
   And I expect to not see a link to the root page
   And I expect to see the header "Works List"

Scenario: Works are the first 10 works
  When I open the root page
  Then I expect to see the given works images
    |image1.com|
    |image2.com|
    |image3.com|
    