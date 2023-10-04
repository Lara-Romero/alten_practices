import UIKit

var a: Int = 1
var b: Int = 2

var c: (Int, String) = (1, "Hola")

print(c)
print(c.1) //Para imprimir un valor determinado

var numeros = (a, b)

var persona0: (nombre: String, apellidos: String) = ("Lara", "Romero")
var persona1: (String, String) = ("Lara", "Romero")

print(persona0.nombre)
print(persona0.apellidos)
print(persona1.0)
print(persona1.1)

var persona2: (nombre: String, apellidos: String, telefono: Int, dni: String) = ("Lara", "Romero", 959456732, "12345678S")
print(persona2.dni)


func devolverDato() -> (Int, Int, String) {
    //Mi logica
    return (1, 23, "Caray")
}
var result = devolverDato()
print(result.2)

//

func devolverDato2() -> (primerNumero: Int, segundoNumero: Int, estado: String) {
    //Mi logica
    return (1, 23, "Caray")
}
var result2 = devolverDato2()
print(result2.estado)

