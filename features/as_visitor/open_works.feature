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
  Then I expect to see 10 works images
   And I expect to see the given works images
    |http://ih1.redbubble.net/work.31820.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.2041.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.240509.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.26583.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.2729606.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.2828069.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.3201430.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.3502552.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.3745978.1.flat,135x135,075,f.jpg|
    |http://ih1.redbubble.net/work.3775226.1.flat,135x135,075,f.jpg|

Scenario: All makes are shown
  When I open the root page
  Then I expect to see only the given items in the navigation
    |Nikon Corporation|
    |Canon|
    |Fujifilm|
    |Leica|
    |Fuji Photo Film Co., Ltd.|
    |Panasonic|
    
