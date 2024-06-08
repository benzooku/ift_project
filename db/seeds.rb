# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Permission.create(name: 'adminPerm', description: 'adminPermDesc')

user = User.new(name: 'test1', first_name: 'test_name1', email: 'test1@gmail.com',
                password: 'topsecret', password_confirmation: 'topsecret')
user.skip_confirmation!
user.save!

user = User.new(name: 'test2', first_name: 'test_name2', email: 'test2@gmail.com',
                password: 'topsecret', password_confirmation: 'topsecret')
user.skip_confirmation!
user.save!

project = Project.create(name: 'test1')
project = Project.create(name: 'test2')

worker = Worker.new(user_id: user.id, project_id: project.id)
worker.save!
