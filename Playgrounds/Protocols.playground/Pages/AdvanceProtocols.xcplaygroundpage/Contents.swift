//: [Previous](@previous)

import Foundation

//============================
//Generics . Los protocolos no permiten genéricos  -> solo protocolos asociados

protocol Armadura {
    func defensa()
}

protocol Mago {
    associatedtype GradoArmadura: Armadura           // Para que el mago pueda tener diferentes niveles de armadura
    var armadura: GradoArmadura { get }                 // Decimos que la variable armadura tiene que implementar el protocolo Armadura
    func lanzarHechizo()
}

//protocol MagoSupremo: Mago {             <- HERENCIA de protocolos - un protocolo hereda los datos del otro
//    func lanzarHechizoSupremo()
//}

//class Chaman MagoSupremo {
//    func lanzarHechizoSupremo() {
//        
//    }
//    
//    func lanzarHechizo() {
//
//    }
//}

class ArmaduraComun: Armadura {
    func defensa() {
        print("Mi defensa es muy triste")
    }
}

class ArmaduraEpica: Armadura {
    func defensa() {
        print("Mi defensa es casi perfecta")
    }
}

class Persona: Mago {
    var armadura = ArmaduraComun()        //El typealias no es necesario porque se infiere del protocolo Mago
    
    func lanzarHechizo() {
        
    }
}

class Mono: Mago {
    var armadura = ArmaduraComun()
    
    func lanzarHechizo() {
        
    }
}

//var magos: [Mago] <- No está permitido al tener associatedtypes

//some es un tipo opaco, como un tipo de retorno de una funcion -> Nos permite devolver un genérico con constrains, pero
// Unicamente se puede devolver objetos del tipo que hemos indicado (Mago en nuestro caso), solo un tipo concreto
func generarMago() -> some Mago {
    if true {
        return Persona()
    } else {
        return Persona()
    }
}

// No se permite porque los returns son de tipo diferentes
//func generarMago() -> some Mago {
//    if true {
//        return Persona()
//    } else {
//        return Mono()
//    }
//}

func sumar<T: Numeric>(_ p1: T, _ p2: T) -> T {
    return p1 + p2
}

var result = sumar(1, 4)
var resultMago = generarMago()

protocol MeLoInvento {
    
}

extension Int: MeLoInvento { }

//===========

//Los protocolos permiten también el do-casting
if let mago = resultMago as? Persona {
    print("Es una persona")
}

if result is MeLoInvento {
    
}


//____________________________________

//Equatable, Hashable y Comparable  -> Estos protocolos son casos especiales, porque hacen su implementación

//Si se cumplen unos requisitos, automaticamente estaremos haciendo que nuestros tipos de datos implementes estos protocolos

//Equatable y HAsable
// -struct: Si todas sus propiedades son Equatable o Hasable, el struct completo también lo será:
// -enum: Si no tiene tipos asociales
// -enum: donde los tipos asociados sean Equatable o Hasable

struct Noticia: Equatable, Hashable {
    var titulo: String
    var description: String
}

var noticia1 = Noticia(titulo: "1", description: "1")
var noticia2 = Noticia(titulo: "2", description: "2")

if noticia1 == noticia2 {
    print("Son inguales")
} else {
    print("No son iguales")
}


//Comparable
// -enum: sin rawVAlue o que sus tipos asociados sean Comparable
