# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(first_name: 'Cyril', 
			last_name: 'Leclerc', 
			function: 'Administrateur', phone: '0237290929', 
			email: 'paysperche.siap@wanadoo.fr', 
			password: 'siap2828', 
			is_admin: 'true')

# u2 = User.create(first_name: 'Boris', 
# 			last_name: 'Li', 
# 			function: 'Maire', phone: '009393939', 
# 			email: 'boris.li@gmail.com', 
# 			password: '11111111', 
# 			is_admin: 'false')

# c1 = Contact.create(first_name: 'Eric', 
# 			last_name: 'Dupont', 
# 			function: 'Maire', phone: '009393939', 
# 			email: 'eric.dupont@gmail.com', 
# 			password: '11111111')

# c2 = Contact.create(first_name: 'Lucie', 
# 			last_name: 'Kala', 
# 			function: 'Maire', phone: '009393939', 
# 			email: 'lucie.kala@gmail.com', 
# 			password: '11111111')

# c3 = Contact.create(first_name: 'Just', 
# 			last_name: 'Leblanc', 
# 			function: 'Maire', phone: '009393939', 
# 			email: 'Just.leblanc@gmail.com', 
# 			password: '11111111')

# c4 = Contact.create(first_name: 'Boris', 
# 			last_name: 'Martin', 
# 			function: 'Maire', phone: '009393939', 
# 			email: 'boris.martin@gmail.com', 
# 			password: '11111111')

# c5 = Contact.create(first_name: 'Rake', 
# 			last_name: 'Nicolardot', 
# 			function: 'Maire', phone: '009393939', 
# 			email: 'rake.nicolardot@gmail.com', 
# 			password: '11111111')
	
# u1.contacts = [c1, c2, c3, c4, c5]