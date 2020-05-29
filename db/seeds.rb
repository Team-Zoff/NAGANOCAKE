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

Genre.create!(
	[
		{
			name: 'ケーキ',
			valid_invalid: 0
		},
		{
			name: 'プリン',
			valid_invalid: 0
		},
		{
			name: '焼き菓子',
			valid_invalid: 0
		},
		{
			name: 'キャンディ',
			valid_invalid: 0


Product.create!(
	[
		{
			genre_id: 1,
			product_name: 'test',
			description: 'test',
			product_image_id: 'test',
			price_excluding_tax: 50000,
			sale_status: 0
		},
		{
			genre_id: 1,
			product_name: 'test',
			description: 'test',
			product_image_id: 'test',
			price_excluding_tax: 50000,
			sale_status: 0
		},
		{
			genre_id: 1,
			product_name: 'test',
			description: 'test',
			product_image_id: 'test',
			price_excluding_tax: 50000,
			sale_status: 0
		},
		{
			genre_id: 1,
			product_name: 'test',
			description: 'test',
			product_image_id: 'test',
			price_excluding_tax: 50000,
			sale_status: 0
		},
		{
			genre_id: 1,
			product_name: 'test',
			description: 'test',
			product_image_id: 'test',
			price_excluding_tax: 50000,
			sale_status: 0
		},
		{
			genre_id: 1,
			product_name: 'test',
			description: 'test',
			product_image_id: 'test',
			price_excluding_tax: 50000,
			sale_status: 0
		},
		{
			genre_id: 1,
			product_name: 'test',
			description: 'test',
			product_image_id: 'test',
			price_excluding_tax: 50000,
			sale_status: 0
		},
		{
			genre_id: 1,
			product_name: 'test',
			description: 'test',
			product_image_id: 'test',
			price_excluding_tax: 50000,
			sale_status: 0

