attendance_checker
===


You can manage participants' attendance easily by useing this application.

---


## Environment

- ruby 1.9.3
- rails 4.1.1


## Usage

1. Change digest authentication password in app/controllers/aplication_controller.rb

2. Edit db/class_template.csv & db/participant_template.csv

Write **class_name** in each line of db/class_template.csv, and also write **name,classification_id** in each line of db/participant_template.csv.  
Please make sure that the number of classes equals to the number of classification kinds.

2. Execute commands below

```
bundle exec rake db:seed
bundle exec rails s -e production -p 4649 -d # run
```
