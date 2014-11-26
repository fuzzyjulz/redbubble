Feature: Open model
  In order to view the camera models in the system
  A visitor
  
Scenario: Visitor can access models page
  When I open the model "DMC-FZ30" for the make "Panasonic"
  Then I expect to see 2 works images
   And I expect to see a link to the root page
   And I expect to see the header "DMC-FZ30"

Scenario: Works are the works for the camera make
  When I open the model "DMC-FZ30" for the make "Panasonic"
  Then I expect to see 2 works images
   And I expect to see the given works images
    |http://ih1.redbubble.net/work.3745978.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.3775226.1.flat,135x135,075,f.jpg|

Scenario: Navigation contains all the relevant items
  When I open the model "DMC-FZ30" for the make "Panasonic"
  Then I expect to see only the given items in the navigation
    |<< Back|
    |<< Back to Panasonic|