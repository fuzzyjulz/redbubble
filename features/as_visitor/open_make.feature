Feature: Open make
  In order to view the camera makes in the system
  A visitor
  
Scenario: Visitor can access makes page
  When I open the make "Leica"
  Then I expect to see 5 works images
   And I expect to see a link to the root page
   And I expect to see the header "Leica"

Scenario: Works are the works for the camera make
  When I open the make "Leica"
  Then I expect to see 5 works images
   And I expect to see the given works images
    |http://ih1.redbubble.net/work.2729606.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.3201430.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.3502552.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.512919.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.4250369.1.flat,135x135,075,f.jpg|

Scenario: Navigation contains all the relevant items
  When I open the make "Leica"
  Then I expect to see only the given items in the navigation
    |<< Home|
    |D-LUX 3|