# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create! :name => 'admin', :surname => 'admin', :dni => 20000000, :birthdate => '10-10-1980',:phone => 2215000000, :email => 'admin@g.com',vencimiento_licencia: "10-03-2028", :role => 2, :password => '123Alqui', :password_confirmation => '123Alqui'
user2 = User.create! :name => 'supervisor', :surname => 'supervisor', :dni => 20000001, :birthdate => '09-10-1980', :phone => 2215000001, :email => 'su@g.com',vencimiento_licencia: "10-03-2028", :role => 1, :password => '123Alqui', :password_confirmation => '123Alqui'
user3 = User.create! :name => 'conductor', :surname => 'driver', :dni => 20000002, :birthdate => '08-10-1980', saldo: 999999999,:phone => 2215000002, :email => 'user@g.com',vencimiento_licencia: "10-03-2028", :role => 0, :password => '123Alqui', :password_confirmation => '123Alqui'

users = User.create([
    {name:"Emilio",surname:"Perez",dni:"10638296",birthdate:"10-10-1960",phone:"0387528735",email:"emiliop@gmail.com",vencimiento_licencia: "10-03-2028",role:0,password:"123Alqui",password_confirmation:"123Alqui"},
    {name:"Susana",surname:"Garcia",dni:"9587432",birthdate:"04-09-1960",phone:"221674902",email:"susanagarcia@hotmail.com",vencimiento_licencia: "10-03-2028",role:0,password:"123Alqui",password_confirmation:"123Alqui"},
    {name:"Juan Carlos",surname:"Gonzalez",dni:"7395206",birthdate:"10-03-1958",phone:"11472937",email:"juancgon@yahoo.com",vencimiento_licencia: "10-03-2028",role:0,password:"123Alqui",password_confirmation:"123Alqui"},
    {name:"Pedro",surname:"Dominguez",dni:"30324981",birthdate:"01-12-1980",phone:"3489827364",email:"pedrod@live.com",vencimiento_licencia: "10-03-2028",role:0,password:"123Alqui",password_confirmation:"123Alqui"},
    {name:"Marcela",surname:"Ramirez",dni:"26645366",birthdate:"11-11-1975",phone:"221330267",email:"marcela.ramirez@gmail.com",vencimiento_licencia: "10-03-2028",role:0,password:"123Alqui",password_confirmation:"123Alqui"},
    {name:"Domingo",surname:"Juarez",dni:"30787365",birthdate:"10-01-1980",phone:"11566673",email:"domingo@yahoo.com",vencimiento_licencia: "10-03-2028",role:0,password:"123Alqui",password_confirmation:"123Alqui"},
    {name:"Manuel",surname:"Gimenez",dni:"40367231",birthdate:"09-01-2000",phone:"11566673",email:"manuelgimenez@gmail.com",vencimiento_licencia: "10-03-2028",role:0,password:"123Alqui",password_confirmation:"123Alqui"},
    {name:"Francisco",surname:"Perez",dni:"43655884",birthdate:"09-01-2000",phone:"11566673",email:"saldo@g.com",saldo: -100,vencimiento_licencia: "10-03-2028",role:0,password:"123Alqui",password_confirmation:"123Alqui"}
])
cars = Car.create([
            {marca: "Audi", modelo:"A3", ano:"2022", color:"Azul", transmision:"Automatica", capacidad:"4",ubication:"-34.91157291234968, -57.94059819120864", patente: 'AD413PS', disponible: true},
            {marca: "Mercedes Benz", modelo:"Clase C", ano:"2022", color:"Gris", transmision:"Automatica", capacidad:"2",ubication:"-34.92220742287483, -57.97210323127062", patente: 'AD037KJ', disponible: true},
            {marca: "BMW", modelo:"Serie 3", ano:"2022", color:"Negro", transmision:"Automatica", capacidad:"4",ubication:"-34.921488750606564, -57.956536581327406",patente: 'AD672JI',disponible: true},
            {marca: "Toyota", modelo:"Camry", ano:"2022", color:"Azul", transmision:"Automatica", capacidad:"4",ubication:"-34.92054009357561, -57.9305220447106",patente: 'AD036SG',disponible: true},
            {marca: "Honda", modelo:"Civic", ano:"2022", color:"Blanco", transmision:"Automatica", capacidad:"4",ubication:"-34.93383933999637, -57.965570292991714", patente: 'AD836MF',disponible: true},
            {marca: "Ferrari", modelo:"488", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.932396841058896, -57.93801864135309", patente: 'AD362VB',disponible: true},
            {marca: "Audi", modelo:"A4", ano:"2022", color:"Negro", transmision:"Automatica", capacidad:"2",ubication:"-34.90746242571045, -57.945803702558536",patente: 'AD836OK',disponible: true},
            {marca: "BMW", modelo:"Serie 4", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"2",ubication:"-34.90935624484942, -57.95476038647663",patente: 'AD834FJ',disponible: true},
            {marca: "Audi", modelo:"A6", ano:"2022", color:"Gris", transmision:"Automatica", capacidad:"4",ubication:"-34.911440903653826, -57.96802207196195",patente: 'AD946HU',disponible: true},
            {marca: "BMW", modelo:"Serie 5", ano:"2022", color:"Rojo", transmision:"Automatica", capacidad:"4",ubication:"-34.91369987647464, -57.94841265387437",patente: 'AD285FB',disponible: true}
        ])

parametros = Parametro.create! :tarifa => 100
