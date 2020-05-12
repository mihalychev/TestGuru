# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  { title: 'Ruby' },
  { title: 'Rails' },
  { title: 'Frontend' }
])

users = User.create!([
  { name: 'Maxim' },
  { name: 'Admin' }
])

tests = Test.create!([
  { title: 'Ruby', level: 1, category_id: categories[0].id, user_id: users[1].id },
  { title: 'Rails', level: 2, category_id: categories[1].id, user_id: users[1].id },
  { title: 'JavaScript', level: 1, category_id: categories[2].id, user_id: users[1].id }
])

questions = Question.create!([
  { text: 'Является ли Ruby полностью объектно-ориентированным языком?', test_id: tests[0].id },
  { text: 'Что такое Rails?', test_id: tests[1].id },
  { text: 'Можно ли вести Backend разработку на JS?', test_id: tests[2].id }
])

answers = Answer.create!([
  { text: 'Является', correct: true, question_id: questions[0].id },
  { text: 'Не является', correct: false, question_id: questions[0].id },
  { text: 'Фреймворк', correct: true, question_id: questions[1].id },
  { text: 'Язык гипертекстовой разметки', correct: false, question_id: questions[1].id },
  { text: 'Да', correct: true, question_id: questions[2].id },
  { text: 'Нет', correct: false, question_id: questions[2].id }
])

tests_users = TestsUser.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[0].id, test_id: tests[2].id }
])