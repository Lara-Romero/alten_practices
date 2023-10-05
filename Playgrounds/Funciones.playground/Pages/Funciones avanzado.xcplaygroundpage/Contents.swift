//: [Previous](@previous)

import Foundation

func decirHola() {
    print("Hello world")
}

decirHola()

print("=========")

func montarSaludo(nombre: String) -> String {
    return "Hola, \(nombre)"
}

print(montarSaludo(nombre: "María"))

print("=========")

//para obviar el nombre
func montarSaludo(_ nombre: String) -> String {
    return "Hola, \(nombre)"
}

print(montarSaludo("Laura"))

print("=========")

//poniéndole un nombre interno y otro externo al parámetro
func montarSaludo(n nombre: String) -> String {
    return "Hola, \(nombre)"
}

print(montarSaludo(n: "Ana"))

print("=========")

//con throws, haciendo el bloque do/catch
func cargarDatos() throws -> Data {
    return try Data(contentsOf: URL(string: "/algo.com")!)
}

do {
    try cargarDatos()
} catch {
    print(error)
}

print("=========")

func devuelveNumero() -> Int {
    Int.random(in: 0...100)       //Cuando tenemos una función que solo tiene una línea podemos obviar el return
}

print(devuelveNumero())

print("=========")

// Las funciones están diseñadas para devolver un solo tipo de dato
// Si puntualmente queremos que devuelva más de uno:
func devuelveNumeros() -> (Int, Int) {
    (Int.random(in: 0...100), Int.random(in: 0...100))            //-> tupla de elementos (omitimos return)
}

print(devuelveNumeros())

print("=========")

// Queremos volcar los datos de "a" en "b" y de "b" en "a"
var a: Int = 10
var b: Int = 20

func intercambiaDatos(a: inout Int, b: inout Int) {
    let c = a                            // Estos valores pasan a ser constantes y como estamos en tipos por valor, no podríamos variar su contenido
    a = b                                 // para poder hacerlo, usamos el "inout"  -> Estos datos cambian en este momento a ser "datos por referencia"                                                      -> el cambio será fuera del ámbito
    b = c
}

print("a: \(a)")
print("b: \(b)")
intercambiaDatos(a: &a, b: &b)              //Al utilizar el inout, tenemos que poner los valores con & delante
print("a: \(a)")
print("b: \(b)")

print("=========")

func suma(_ numeros: Int...) -> Int {         //Int...    -> numero variable de enteros
    var result = 0
    for numero in numeros {                // es como si fuera un array
        result += numero
    }
    return result
}

print(suma(2, 3, 44, 3, 1, 98))

print("=========")

//función dentro de función
func saluda() {
    func cargarSaludo(nombre: String) -> String {
        "Saludos, \(nombre)"
    }
    print(cargarSaludo(nombre: "Mercedes"))
}

saluda()


print("=========")

// Las funciones son parámetros.
//Podemos almacenar funciones en una variable para usarlas después
var parametroSaluda: () -> Void = saluda // Function type = Parámetros de entrada + parámetros de salida

parametroSaluda()
