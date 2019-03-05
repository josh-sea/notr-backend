# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(username: 'joshsea')
User.create(username: 'tom', password: '123')
User.create(username: 'jerry', password: '123')

c1 = Classroom.create(name: 'Bio 101')
c2 = Classroom.create(name: 'Math 101')
c3 = Classroom.create(name: 'English 101')

Note.create(title:"Test Note 1", content: 'Test Notes', user_id: User.first.id, classroom_id: 1)
Note.create(title:"Test Note 2", content: 'Test Notes', user_id: User.first.id, classroom_id: 1)
Note.create(title:"Test Note 3", content: 'Test Notes', user_id: User.first.id, classroom_id: 1)
Note.create(title:"Test Note 4", content: 'Test Notes', user_id: User.first.id, classroom_id: 1)

Note.create(title:"Test Note 5", content: 'Test Notes', user_id: User.first.id, classroom_id: 2)
Note.create(title:"Test Note 6", content: 'Test Notes', user_id: User.first.id, classroom_id: 2)
Note.create(title:"Test Note 7", content: 'Test Notes', user_id: User.first.id, classroom_id: 2)
Note.create(title:"Test Note 8", content: 'Test Notes', user_id: User.first.id, classroom_id: 2)

Note.create(title:"Test Note 9", content: 'Test Notes', user_id: User.first.id, classroom_id: 3)
Note.create(title:"Test Note 10", content: 'Test Notes', user_id: User.first.id, classroom_id: 3)
Note.create(title:"Test Note 11", content: 'Test Notes', user_id: User.first.id, classroom_id: 3)
Note.create(title:"Test Note 12", content: 'Test Notes', user_id: User.first.id, classroom_id: 3)



Note.create(title:"Test Note 13", content: 'Test Notes', user_id: User.second.id, classroom_id: 2)
Note.create(title:"Test Note 14", content: 'Test Notes', user_id: User.second.id, classroom_id: 2)
Note.create(title:"Test Note 15", content: 'Test Notes', user_id: User.second.id, classroom_id: 2)
Note.create(title:"Test Note 16", content: 'Test Notes', user_id: User.second.id, classroom_id: 2)

Note.create(title:"Test Note 17", content: 'Test Notes', user_id: User.second.id, classroom_id: 3)
Note.create(title:"Test Note 18", content: 'Test Notes', user_id: User.second.id, classroom_id: 3)
Note.create(title:"Test Note 19", content: 'Test Notes', user_id: User.second.id, classroom_id: 3)
Note.create(title:"Test Note 20", content: 'Test Notes', user_id: User.second.id, classroom_id: 3)
