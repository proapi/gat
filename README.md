# GAT test app

## Dependencies

  * PostgreSQL
  * Ruby 2.1.5

## Gems

  * Rails 4.2

## Setup

  ```
    bin/setup
  ```

  If not running whole setup, be sure to run:
  
  ```
    rake db:seed
  ```
  
  this is where all the necessary data is defined to populate database with.

## Authentication

  Is based upon sending token in header of the request. Token is generated in model ApiToken while seeding the db, should be searched manualy.
  
## Testing
  
  ```
    rake db:setup RAILS_ENV=test
  ```
  
  ```  
    bin/rspec
  ```

## Quering
  
  Run rails server and hit one of those requests

  Request #1
  
  ```
    curl http://localhost:3000/private/locations/pl -H 'Accept:application/json' -H 'Authorization: Token token="1b1a2e3a976007a0b9aa559add270fed"'
  ```
  
  Request #2
  
  ```
    curl http://localhost:3000/private/target_groups/pl -H 'Accept:application/json' -H 'Authorization: Token token="1b1a2e3a976007a0b9aa559add270fed"'
  ```
    
  Request #3
  
  ```
    curl --data 'country_code=de&target_group_id=1&locations[]={"id": 1, "panel_size": 200}&locations[]={"id": 2, "panel_size": 200}' http://localhost:3000/private/evaluate_target -H 'Accept:application/json' -H 'Authorization: Token token="1b1a2e3a976007a0b9aa559add270fed"'
  ```  
    
  Request #4
  
  ```
    curl http://localhost:3000/locations/uk -H 'Accept:application/json'
  ```

  Request #5
  
  ```
    curl http://localhost:3000/target_groups/uk -H 'Accept:application/json'
  ```
