# Red Bubble Works

## Installation

```
bundle install
```

There are two modes of operation:

1. It may be run as a standard rails web app by just starting...

```
  rails s
```
In this mode the pages are dynamically generated, this makes it easy to load a new datafile and develop as with any other
rails application. 

2. This mode generates the static pages, you may either do this using the defaults, which are to use the included
xml and the public directory as the output path. This allows the cucumber tests to run on the actual static pages, rather
than the dynamic pages allowing the output to be fully tested.
```
  rake app:static
```

Optionally you can provide parameters to the static page generation job, this allows you to output to a different location
or accept a different input file
```
  rake app:static[inputFile.xml,output_directory]
```
- The two locations are relative to the RAILS.root

## Testing
All the tests are written in cucumber, I have included integration tests as well as functional tests. Cucumber isn't
ideal for functional tests, but it does make it easer on larger projects to have helpers that work across the database
and the application to check that things appear correctly.
  
The tests may be run on the dynamic rails application or on the static pages.

Dynamic application:
- Ensure that the public directory does not contain the **index.html** or **make** and **model** directories
```
  bundle exec cucumber
```
  
Static pages application:
```
  rake app:static
  bundle exec cucumber
```

## Development / Design notes
### Why use rails and not standard Ruby?
  I chose to use rails as it is designed for generating HTML, if I had used the template as text and imported blocks into it
  it would have been more difficult to integrate and UI modules that would most likely be used in the future. It would be a
  pretty simple task to move all the css and javascripts into the existing application.css / application.js files, and get
  the generator to produce them as well, or simply move them to something like Amazon S3.
  
  Rails will be also be better as it is much easier to extend the pages and actions in the future as this will most likely
  become part of a much larger part of the system.

### Why are the files in Models similar to ActiveRecord?
  I chose to create the Models similar to Activerecord as the next logical step for this project is to seperate the extraction 
  logic into a seperate process, this could then store the relevant data into a database. This switch to a database would be 
  fairly easy from a coding point of view and would require minimal if any changes to the UI. Using a database would speed up
  everything from the extraction of the data to production of the output html pages. It would also mean that it would be easy
  to push the data into the system in chunks and therefore remove the reliance on running through massive XML files which
  will become more of an overhead.

### How could this be improved for use with more data?
  The main ways of improving the performance of the application would be as mentioned above to use a database to store the
  data rather than using an XML file. 
  
  The generation of pages could be rewritten as a queue, so that pages could be queued for
  regeneration, this would mean that it would be easier to perform small updates as well as large total regenerations.

### Assumptions about the data
- There are a few records in the data that have no camera make/model assigned to them, as they appear to be photoshop
  generated files. I have assumed that these should be included in the list of works, but not have their own blank / nil
  Camera / Model, as the brief appears to be focusing on the cameras rather than the works.
  
- It appears that there are two makes that are probably the same - Fuji Photo Film and Fujifilm. 
  Ideally these should both share a 'Make', this would clean up the UI when there are a lot more camera makes. This was
  not mentioned in the brief so they currently display as two

- For all Make names I have made sure that they apper in title case, as they had a mixture of upper and title case, and
  it just doesn't look great if the system displays like that. I have intentionally not done this for models as often
  camera models have model numbers (which are normally uppercase), names which are normally titlecase or a mix. I have
  also not done any data clensing on the model names, but this would be sensible as some include the make name and others
  don't, it would be ideal to be consistant. This would be best to be part of the suggested database work and performing a
  proper ETL process for this data.

- I have created some 'fake' IDs for the makes and models of the cameras, these IDs are simply a HTML friendly version
  of the name. This had to be done as the links between makes, models and works really need some kind of connection between
  them to make the system flow nicely. I have assumed that these IDs will work correctly for future models and makes.
  It is fairly unlikely to have two makes with the same name except extra spaces or punctuation, or a model/make combination
  in a similar circumstances.