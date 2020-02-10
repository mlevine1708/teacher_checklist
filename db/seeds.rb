#here is where I will create some seed data to work with and test associations

#Create 2 users

micah = Teachers.create(name: "Micah", grade_level: 5, username: "mlevine", password: "password")
brett = Teachers.create(name: "Brett", grade_level: 4, username: "blebowitz", password: "password")

#create some assignment entries 

Assignments.create(title: "SS 1", subject: "Social Studies", user_id: micah.id)

#Use AR to pre-associate data:

#micah.assignments.create(title: "SS 2", subject: "Social Studies")

Students.create(name: "Eli", grade_level: 5)