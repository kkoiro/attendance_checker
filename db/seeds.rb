# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Classification.delete_all
Participant.delete_all

#Classification.create(name: "a")
#Classification.create(name: "b")
#
#Participant.create(name: "user1", classification_id: 1)
#Participant.create(name: "user2", classification_id: 1)
#Participant.create(name: "user3", classification_id: 2)

File.open('db/class_template.csv') do |file|
  file.each_line do |line|
    name = line.chomp
    Classification.create(name: name)
  end
end

File.open('db/participant_template.csv') do |file|
  file.each_line do |line|
    name, id = line.chomp.split(',')
    Participant.create(name: name, classification_id: id)
  end
end
