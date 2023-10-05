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

func montarSaludo(_ nombre: String) -> String {
    return "Hola, \(nombre)"
}

print(montarSaludo("Laura"))

print("=========")

func montarSaludo(n nombre: String) -> String {
    return "Hola, \(nombre)"
}

print(montarSaludo(n: "Ana"))

print("=========")

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
    Int.random(in: 0...100)
}

print(devuelveNumero())

print("=========")

func devuelveNumeros() -> (Int, Int) {
    (Int.random(in: 0...100), Int.random(in: 0...100))
}

print(devuelveNumeros())

print("=========")
var a: Int = 10
var b: Int = 20

func intercambiaDatos(a: inout Int, b: inout Int) {
    let c = a
    a = b
    b = c
}

print("a: \(a)")
print("b: \(b)")
intercambiaDatos(a: &a, b: &b)
print("a: \(a)")
print("b: \(b)")

print("=========")

func suma(_ numeros: Int...) -> Int {
    var result = 0
    for numero in numeros {
        result += numero
    }
    return result
}

print(suma(2, 3, 44, 3, 1, 98))

print("=========")

func saluda() {
    func cargarSaludo(nombre: String) -> String {
        "Saludos, \(nombre)"
    }
    print(cargarSaludo(nombre: "Mercedes"))
}

saluda()


print("=========")

var parametroSaluda: () -> Void = saluda // Function type = Parámetros de entrada + parámetros de salida

parametroSaluda()
