# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create! :name => 'admin', :surname => 'admin', :dni => 20000000, :birthdate => '10-10-1980',:phone => 2215000000, :email => 'admin@g.com', :role => 2, :password => '123Alqui', :password_confirmation => '123Alqui'
user2 = User.create! :name => 'su', :surname => 'supervisor', :dni => 20000001, :birthdate => '09-10-1980', :phone => 2215000001, :email => 'su@g.com', :role => 1, :password => '123Alqui', :password_confirmation => '123Alqui'
user3 = User.create! :name => 'usuario', :surname => 'driver', :dni => 20000002, :birthdate => '08-10-1980', :phone => 2215000002, :email => 'user@g.com', :role => 0, :password => '123Alqui', :password_confirmation => '123Alqui'


cars = Car.create([
            {marca: "Ferrari", modelo:"SF1", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.91157291234968, -57.94059819120864", patente: 'AAA100', disponible: true},
            {marca: "Ferrari", modelo:"SF2", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.92220742287483, -57.97210323127062", patente: 'AAA101', disponible: true},
            {marca: "Ferrari", modelo:"SF3", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.921488750606564, -57.956536581327406",patente: 'AAA102',disponible: true},
            {marca: "Ferrari", modelo:"SF4", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.92054009357561, -57.9305220447106",patente: 'AAA103',disponible: true},
            {marca: "Ferrari", modelo:"SF5", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.93383933999637, -57.965570292991714", patente: 'AAA104',disponible: true},
            {marca: "Ferrari", modelo:"SF6", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.932396841058896, -57.93801864135309", patente: 'AAA105',disponible: true},
            {marca: "Ferrari", modelo:"SF7", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.90746242571045, -57.945803702558536",patente: 'AAA106',disponible: true},
            {marca: "Ferrari", modelo:"SF8", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.90935624484942, -57.95476038647663",patente: 'AAA107',disponible: true},
            {marca: "Ferrari", modelo:"SF9", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.911440903653826, -57.96802207196195",patente: 'AAA108',disponible: true},
            {marca: "Ferrari", modelo:"SF10", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.91369987647464, -57.94841265387437",patente: 'AAA109',disponible: true}
        ])