import UIKit

var miVar: String = "Buenas, qué tal"

print (miVar)
miVar = "Adiós, muy buenas"
print (miVar)

let miConst = "Buenas, qué tal?"

print(miConst)
//miConst = " Adiós"  -> nos daría error ya que las constantes no pueden cambiar su valor

let prueba1 = 9
var prueba2 = 3.8
var prueba3: Double = 7.8

print(prueba1)
print(prueba2)

// prueba2 = "Buenas" -> no podemos porque estamos cambiando de double a string
