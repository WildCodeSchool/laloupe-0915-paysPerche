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
			email: 'Boris@popof.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
User.create(
	[	
		{ first_name: 'Henri', 
			last_name: 'Li', 
			function: 'Deputé', phone: '009393939', 
			email: 'Henri@li.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
User.create(
	[	
		{ first_name: 'Ben', 
			last_name: 'Zak', 
			function: 'élu du Perche', phone: '009393939', 
			email: 'benjamin@Zak.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
User.create(
	[	
		{ first_name: 'Gonzalo', 
			last_name: 'Perez', 
			function: 'fonctionnaire', phone: '009393939', 
			email: 'gonzalo@perez.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
User.create(
	[	
		{ first_name: 'Javier', 
			last_name: 'ederson', 
			function: 'Maire', phone: '009393939', 
			email: 'ederson@javier.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
User.create(
	[	
		{ first_name: 'Paul', 
			last_name: 'Walker', 
			function: 'Maire', phone: '009393939', 
			email: 'paul@walker.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
User.create(
	[	
		{ first_name: 'François', 
			last_name: 'Hollande', 
			function: 'Président', phone: '009393939', 
			email: 'elysee@france.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
User.create(
	[	
		{ first_name: 'Vladimir', 
			last_name: 'Akinfeev', 
			function: 'Maire', phone: '009393939', 
			email: 'akinvlad@france.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)
User.create(
	[	
		{ first_name: 'Pierre', 
			last_name: 'Dupont', 
			function: 'Maire', phone: '009393939', 
			email: 'dupont@pierre.com', 
			password: '11111111', 
			is_admin: 'false'}
	]
)