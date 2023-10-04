import UIKit

//El clousure no se puede imprimir al principio del código, tiene que ser sobre algo, por ejemplo: una variable
func sayHelloWorld() {
    print("-----")
    print("Hello")
    print("World")
    print("-----")
}

sayHelloWorld()

/*Lo que contiene un clousure
 {  (parámetros) -> (tipo devuelto) in
        Implementación
 }
 */

//Clousure:
var imprimir = { () -> Void in
    print("====")
    print("Hello")
    print("World")
    print("====")
}
imprimir()

print("\n")

var prueba1: () -> Void = sayHelloWorld

prueba1()


var pruebaConParametros: (String, String) -> String = { (nombre, apellidos) -> String in
    return "Nombre completo: \(nombre), \(apellidos)"
}
print(pruebaConParametros("Lara", "Romero Ramírez"))


func pruebaNombreApellidos (nombre: String, apellidos: String) ->String {
    return "Nombre completo: \(nombre), \(apellidos)"
}
print(pruebaNombreApellidos(nombre: "Lara", apellidos: "Romero Ramírez"))


var pruebaConParametros2: (String, String) -> String = pruebaNombreApellidos
print(pruebaConParametros2("Lara", "Romero Ramírez"))

//Abreviado
var pruebaConParametrosAbreviado: (String, String) -> String = {
    return "Nombre completo: \($0), \($1)"
}
print(pruebaConParametrosAbreviado("Pepito", "Grillo"))


//Otro ejemplo
var numeros = [1, 5, 4, 3, 7]

numeros.sorted { numero1, numero2 in
    numero1 < numero2
}

numeros.sorted(by: { numero1, numero2 in
    numero1 < numero2
})


func pruebaTrailingClousure(dni: String, nombreComleto: ((String, String) -> String)) {
    print(dni)
    print(nombreComleto("Marta", "Pérez"))
}

pruebaTrailingClousure(dni: "4567890E") {
    return "Nombre completo: \($0), \($1)"
}

pruebaTrailingClousure(dni: "4567890E") {
    return "Nombre completo: \($1), \($0)"
}
