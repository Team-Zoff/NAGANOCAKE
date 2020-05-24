# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
	email: 'zoff@zoff.com',
	password: 'zoffzoff'
	)

# テスト用
Member.create!(
	first_name: "鈴木",
	last_name:"スズキ",
	email: "b@b",
	password: "bbbbbb",
	deleted_status: 1
	)