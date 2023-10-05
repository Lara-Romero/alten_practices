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
    var armadura = ArmaduraComun()        //El typealias  no es necesario porque se infiere del protocolo Mago
    
    func lanzarHechizo() {
        
    }
}

class Mono: Mago {
    var armadura = ArmaduraComun()
    
    func lanzarHechizo() {
        
    }
}

//var magos: [Mago] <- No está permitido al tener associatedtypes

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

if let mago = resultMago as? Persona {
    print("Es una persona")
}

if result is MeLoInvento {
    
}
