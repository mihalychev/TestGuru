# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  { name: 'Maxim' },
  { name: 'Admin' }
])

categories = Category.create!([
  { title: 'Ruby' },
  { title: 'Rails' },
  { title: 'Frontend' }
])

tests = Test.create!([
  { title: 'Ruby', level: 1, category_id: categories[0].id },
  { title: 'Rails', level: 1, category_id: categories[1].id },
  { title: 'JavaScript', level: 1, category_id: categories[2].id }
])

questions = Question.create!([
  { text: 'Является ли Ruby полностью объектно-ориентированным языком?' },
  { text: 'Что такое Rails?' },
  { text: 'Можно ли вести Backend разработку на JS?' }
])

answers = Answer.create!([
  { text: 'Является', correct: true, question_id: questions[0].id },
  { text: 'Не является', correct: false, question_id: questions[0].id },
  { text: 'Фреймворк', correct: true, question_id: questions[1].id },
  { text: 'Язык гипертекстовой разметки', correct: false, question_id: questions[1].id },
  { text: 'Да', correct: true, question_id: questions[2].id },
  { text: 'Нет', correct: false, question_id: questions[2].id }
])

users_completed_tests = UserCompletedTest.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[2].id }
])