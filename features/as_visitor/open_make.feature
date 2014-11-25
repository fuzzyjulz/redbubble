Feature: Open make
  In order to view the camera makes in the system
  A visitor
  Should be able to navigate to the makes pages
  
Scenario: Visitor can access makes page
  When I open the root page
   And I open the make "Make1"
  Then I expect to see 3 works images
   And I expect to see a link to the root page
   And I expect to see the header "Make1"

Scenario: Works are the works for the camera model
  When I open the root page
  Then I expect to see the given works images
    |image1.com|
    |image2.com|
    |image3.com|
