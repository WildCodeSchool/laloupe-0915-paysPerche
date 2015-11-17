# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
	[	
		{ first_name: 'Syyrius', 
			last_name: 'Jio', 
			function: 'Administrateur', phone: '009393939', 
			email: 'xx@xxxx.com', 
			password: '11111111', 
			is_admin: 'true'}
	]
)
User.create(
	[	
		{ first_name: 'Boris', 
			last_name: 'Li', 
			function: 'Maire', phone: '009393939', 
			email: 'xx@xxxx.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
User.create(
	[	
		{ first_name: 'Henri', 
			last_name: 'Li', 
			function: 'Deputé', phone: '009393939', 
			email: 'xx@xxxx.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
