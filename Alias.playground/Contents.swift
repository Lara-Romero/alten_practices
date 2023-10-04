import UIKit

typealias Pepito = String

var prueba1: Pepito = "Hello World"

print(prueba1)

//Utilidad tuplas
func crearPersona0(persona: (String, String, String)) -> (String, String, String) {
    return persona
}
//Para que sea mucho más sencilla la función y más legible:
typealias Persona = (String, String, String)

func crearPersona(persona: Persona) -> Persona {
    return persona
}

crearPersona(persona: ("", "", "" ))

//Ejemplo clousure
var clousure: (String, Bool, Int) -> Void

typealias Trabajo = (String, Bool, Int) -> Int
var clousure1: Trabajo //más claro así

//lo volvemos a usar en una función:
func irAlTrabajo(duracion: Int, trabajo: Trabajo) {
    
}



