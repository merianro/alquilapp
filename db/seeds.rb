# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create! :name => 'admin', :email => 'admin@g.com', :role => 2, :password => '123123', :password_confirmation => '123123'
user2 = User.create! :name => 'su', :email => 'su@g.com', :role => 1, :password => '123123', :password_confirmation => '123123'
user3 = User.create! :name => 'user', :email => 'user@g.com', :role => 0, :password => '123123', :password_confirmation => '123123'

cars = Car.create([
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.91157291234968, -57.94059819120864",tipo:"Superauto",disponible: true},
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.92220742287483, -57.97210323127062",tipo:"Superauto",disponible: true},
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.921488750606564, -57.956536581327406",tipo:"Superauto",disponible: true},
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.92054009357561, -57.9305220447106",tipo:"Superauto",disponible: true},
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.93383933999637, -57.965570292991714",tipo:"Superauto",disponible: true},
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.932396841058896, -57.93801864135309",tipo:"Superauto",disponible: true},
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.90746242571045, -57.945803702558536",tipo:"Superauto",disponible: true},
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.90935624484942, -57.95476038647663",tipo:"Superauto",disponible: true},
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.911440903653826, -57.96802207196195",tipo:"Superauto",disponible: true},
            {marca: "Ferrari", modelo:"SF90", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.91369987647464, -57.94841265387437",tipo:"Superauto",disponible: true}
        ])