# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
	[	
		{ first_name: 'Cyril', 
			last_name: 'Leclerc', 
			function: 'Administrateur', phone: '0939393939', 
			email: 'xx@xxxx.com', 
			password: '11111111', 
			is_admin: 'true'}
	]
)

Contact.create(
	[	
		{ first_name: 'Benjamin', 
			last_name: 'Zak', 
			function: 'Décorateur', phone: '0232224455', 
			email: 'tom.eric@gmail.com', 
			password: '11111111', 
			user_id: '1'}
	]
)

Contact.create(
	[	
		{ first_name: 'Edem', 
			last_name: 'Alomatsi', 
			function: 'Maçon', phone: '0233241188', 
			email: 'edem.alomatsi@gmail.com', 
			password: '11111111', 
			user_id: '1'}
	]
)

Contact.create(
	[	
		{ first_name: 'Julien', 
			last_name: 'Vallar', 
			function: 'Ebéniste', phone: '0327653244', 
			email: 'jivé@hotmail.fr', 
			password: '11111111', 
			user_id: 1}
	]
)

Contact.create(
	[	
		{ first_name: 'Mathieu', 
			last_name: 'Carbonel', 
			function: 'Taxi', phone: '0327653244', 
			email: 'karbo@gmail.com', 
			password: '11111111', 
			user_id: 1}
	]
)

Contact.create(
	[	
		{ first_name: 'Caroline', 
			last_name: 'Foucault', 
			function: 'Community manager', phone: '0232653244', 
			email: 'caro.wcs@gmail.com', 
			password: '11111111', 
			user_id: 1}
	]
)

Contact.create(
	[	
		{ first_name: 'Joao', 
			last_name: 'Pinto', 
			function: 'Epicier', phone: '0232653244', 
			email: 'j.pinto@gmail.com', 
			password: '11111111', 
			user_id: 1}
	]
)

Contact.create(
	[	
		{ first_name: 'Benoît', 
			last_name: 'Favier', 
			function: 'Carreleur', phone: '0232653244', 
			email: 'benoit.f@gmail.com', 
			password: '11111111', 
			user_id: 1}
	]
)

Contact.create(
	[	
		{ first_name: 'Jean', 
			last_name: 'castel', 
			function: 'Plombier', phone: '0232653244', 
			email: 'J.castel@gmail.com', 
			password: '11111111', 
			user_id: 1}
	]
)