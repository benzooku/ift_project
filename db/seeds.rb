# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Permission.create(name: 'adminPerm', description: 'adminPermDesc')

user = User.new(name: 'test', first_name: 'test', email: 'test@gmail.com',
                password: 'topsecret', password_confirmation: 'topsecret')
user.skip_confirmation!
user.save!

project = Project.create(name: 'test')

worker = Worker.new(user_id: user.id, project_id: project.id)
worker.save!
