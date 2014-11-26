# Red Bubble Works

## Installation

  ```
    bundle install
  ```
  
  There are two modes of operation, it may be run as a standard rails web app by just starting...
  1. 
  ```
    rails s
  ```
  In this mode the pages are dynamically generated, this makes it easy to load a new datafile and develop as with any other
  rails application. 
  
  2.
  This mode generates the static pages, you may either do this using the defaults, which are to use the included
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
  