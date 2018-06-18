# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy all"
Gift.destroy_all
Participation.destroy_all
List.destroy_all
User.destroy_all

puts "start User"

u1 = User.create!(first_name: "Camomille", last_name: "Franchin", email: "cfranchin@gmail.com", password: "123456")
u2 = User.create!(first_name: "Patrick", last_name: "Bonnard", email: "pbonnard@gmail.com", password: "123456")
u3 = User.create!(first_name: "Francine", last_name: "Pompidou", email: "fpompidou@gmail.com", password: "123456")
u4 = User.create!(first_name: "Antoine", last_name: "Lejeune", email: "alejeune@gmail.com", password: "123456")
u5 = User.create!(first_name: "Monique", last_name: "Champard", email: "mchampard@gmail.com", password: "123456")
u6 = User.create!(first_name: "Estelle", last_name: "Galoa", email: "egaloa@gmail.com", password: "123456")


puts "Start List"

l1 = List.create!(name:"Liste de Noël de Camomille", status: 0, owner: u1 )
l2 = List.create!(name:"Liste de Noël de Patrick", status: 0, owner: u2 )
l3 = List.create!(name:"Liste de Noël de Francine", status: 0, owner: u3 )
l4 = List.create!(name:"Liste de Noël de Antoine", status: 0, owner: u4 )
l5 = List.create!(name:"Liste de Noël de Monique", status: 1, owner: u5 )

puts "Start Participation"

p1 = Participation.create!(list: l1, user: u2)
p2 = Participation.create!(list: l1, user: u3)
p3 = Participation.create!(list: l1, user: u4)
p5 = Participation.create!(list: l1, user: u6)

p6 = Participation.create!(list: l2, user: u3)
p7 = Participation.create!(list: l2, user: u1)
p8 = Participation.create!(list: l2, user: u6)

p9 = Participation.create!(list: l5, user: u1)

p10 = Participation.create!(list: l3, user: u2)
p11 = Participation.create!(list: l3, user: u4)
p12 = Participation.create!(list: l3, user: u5)

p13 = Participation.create!(list: l4, user: u3)

puts "Start Gifts"

# List 1
g1 = Gift.create!(list: l1, giver: u2, name: "Appareil Photo", description: "Reflex trop top. J'ai repéré le DC35 de Canon", status: 1, brand:"Canon", link: "https://www.fnac.com/Reflex-Canon-EOS-100D-Obj-Canon-EF-S-IS-STM-18-55-mm-f-3-5-5-6/a5782281/w-4")
g2 = Gift.create!(list: l1, name: "Chaussette Verte", description: "qui gratte pas", status: 0)
g3 = Gift.create!(list: l1, giver: u4, name: "Pull Tete d'Elan", description: "pull de noel bien kitch", status: 2, link: "https://lifeandswing.files.wordpress.com/2012/10/mark-darcy.jpg?w=462&h=318")
g4 = Gift.create!(list: l1, name: "Aspiro", status: 0, brand: "Dyson")

#List 2
Gift.create!(list: l2, giver: u4, name: "Appareil Photo", description: "Reflex", status: 1, brand:"Canon", link: "https://www.fnac.com/Reflex-Canon-EOS-100D-Obj-Canon-EF-S-IS-STM-18-55-mm-f-3-5-5-6/a5782281/w-4")
Gift.create!(list: l2, name: "Chaussette Rouge", description: "qui gratte pas en Cachemire", status: 0)
Gift.create!(list: l2, giver: u2, name: "Pull Bonhomme de Neige", description: "pull de noel bien kitch", status: 2)
Gift.create!(list: l2, name: "Seche Cheveux", status: 0, brand: "Dyson")

#List 3
Gift.create!(list: l3, name: "Manteau Rouge", description: "Cachemire", status: 0, brand: "DG")

#List 4
Gift.create!(list: l4, giver: u1, name: "Appareil Photo", description: "Reflex", status: 1, brand:"Canon", link: "https://www.fnac.com/Reflex-Canon-EOS-100D-Obj-Canon-EF-S-IS-STM-18-55-mm-f-3-5-5-6/a5782281/w-4")
Gift.create!(list: l4, name: "Chaussette Bleu", description: "qui gratte pas en Cachemire", status: 0)
Gift.create!(list: l4, giver: u3, name: "Pull Sweat", description: "Pilou Pilou", status: 1)
Gift.create!(list: l4, name: "Poubelle 30L", status: 0)

#List 5
Gift.create!(list: l5, giver: u1, name: "Peignoire", description: "Pilou Pilou", status: 1)
Gift.create!(list: l5, name: "Parfum", brand:"Hugo Boss", status: 0)

 puts "Finished"
