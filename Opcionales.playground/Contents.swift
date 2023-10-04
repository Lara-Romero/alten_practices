import UIKit

var nombre: String?  = nil   //Option.none equivale a nil -> nulo   var nombre: String?  = Optional.none
nombre = "Lara"

// Optional.some("Lara")     esto es un opcional que no es nulo, que tiene un valor
print(nombre)


var nombre1: Optional<String>  //ESto es lo mismo que la variable anterior nombre
nombre1 = .none
print(nombre1)
nombre1 = .some("Juani")
print(nombre1)

nombre = nil
switch nombre {
case .none:
    print("No tiene nada dentro")
case .some(let item):
    print("Tiene almacenado \(item)")
}

nombre = "Manolito"
switch nombre {
case .none:
    print("No tiene nada dentro")
case .some(let item):
    print("Tiene almacenado: \(item)")
}


//ejemplos de declaración de opcionales
var edad: Int? = nil
var status: Bool? = nil
var array: [String]? = nil
var arrayNumeros: [Int?]? = nil
var tupla: (String, String)? = nil
var otraTupla: (Int?, Bool, String, String?)? = nil
var clousure: (() ->Void)? = nil
var clousure2: ((Int?, String, Bool?) -> String?)? = nil

//No funciona con valores nulos:
var saluda: String? = nil
var texto: String

saluda = "Hello World"
print(saluda)   //esto en un proyecto nos daría error

texto = saluda!  // ESto es un Forced unwraping -> su uso no es muy recomendable, muuuuuy determinadas ocasiones

//Solucionamos el no poner la !:
//Optional Binding   -> desempaquetado
do {
    var nombre: String?
    var apellidos: String?
    nombre = "Juanito"
    // nombre = nil
    
    var texto: String
    if let nombre = nombre {
        texto = nombre
        print(texto)
    }else {
        print("No existe nombre")
    }
    
    if let nombre = nombre, nombre == "Juanito" {
        print("Es Juanito")
    }
    
    if let nombre = nombre, let apellidos = apellidos {
        print(nombre + apellidos)
    }
}

//ejemplo clousure
do {
    var clousure: (() -> Void)?   //¿Cómo llamamos a un clousure opcional?
    
    clousure?()   // Podemos hacer un desempaquetado del clousure para que si existe el clousure, se llame
    if let clousure = clousure {
        print("Entra 1")
        clousure()
    }
    
    if clousure?() == nil {
        print("No se ha llamado al clousure")
    } else {
        print("Se ha llamado al clousure")
    }
    
    clousure = {
        print("Tiene implementación")
    }
    
    clousure?()
    if let clousure = clousure {
        print("Entra 2")
        clousure()
    }
    
    if clousure?() == nil {
        print("No se ha llamado al clousure")
    } else {
        print("Se ha llamado al clousure")
    }
}


//Otra implenetación no relacionada con los opcionales:
do {
    var nombre: String? = nil
    print(nombre ?? "Javi")
    // return array?.count ?? 0
}


// Optional Chaining  --> una forma de encadenar los nulos, opcionales
do{
    var numeros: [Int]? = nil  //Para saber cuantos números tengo dentro del array:
    print(numeros?.count ?? 0)
    numeros = [2, 4 ,5, 3, 7, 9]
    numeros?.filter{            //Trailing clousure
        $0 < 5
    }.forEach{
        print("Número \($0)")
    }
    print("____")
    if let numeros = numeros {
        numeros.filter {
            $0 < 5
        }.forEach {
            print("Número \($0)")
        }
    } /*else {
        print("No hay números que mostrar")
    } */
}



print("=================")

print("Ejemplo 1:")
struct Persona {
    var direccion: Direccion?
}

struct Direccion {
    var calle: String
}

let persona = Persona(direccion: Direccion(calle: "123 Calle Principal"))

if let calle = persona.direccion?.calle {
    print("Vive en la calle \(calle)")
} else {
    print("La dirección no está definida")
}

