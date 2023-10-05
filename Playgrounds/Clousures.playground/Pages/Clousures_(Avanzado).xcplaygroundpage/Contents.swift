//: [Previous](@previous)

import Foundation

import UIKit

var miClosure: (String) -> Void

func saluda(nombre: String) {               //Esta es una función que cumple el contrato del clousure -> es equivalente
    print("Hola \(nombre)")
}

miClosure = saluda


miClosure("Manuel")

miClosure = { texto in
    print("Estoy mostrando el texto \(texto)")
}

miClosure("Manuel")    //Nos hace falta porque el clouse no ejecuta la función dentro de él, por tanto, tenemos que llamarlo

// autoclosures
do {
    var personas = ["Rafa", "Manuel", "María", "Marta", "José"]
    
//    func saludaPersona(persona: String) {
//        print("Bienvenido \(persona)")
//    }
//    saludaPersona(persona: personas[0])                       -> por posición
//    personas.remove(at: 0)                                           -> la borramos del array
//    saludaPersona(persona: personas[0])
//    func saludaPersona(persona: () -> String) {                   -> HAcemos las dos cosas a la vez
//        print("Bienvenido \(persona())")
//    }
//    saludaPersona {
//        personas.remove(at: 0)
//    }
//    saludaPersona {
//        personas.remove(at: 0)
//    }
//    saludaPersona {
//        personas.remove(at: 0)
//    }
    
    // La mejor forma de hacer lo anterior
    func saludaPersona(persona: @autoclosure () -> String) {
        print("Bienvenido \(persona())")
    }
    
    saludaPersona(persona: personas.remove(at: 0))             //personas.remove(at: 0) lo usa como un clousure -> lo ejevuta después
    saludaPersona(persona: personas.remove(at: 0))
    saludaPersona(persona: personas.remove(at: 0))
    
}

print("===========")
// @escaping
do {
    class Guerrero {
        var hp: Int = 100 {
            didSet {
                if hp < 0 {
                    ejcutarAlMorir()
                }
            }
        }
        var ataque: Int = 20
        var velocidad: Int = 10
        var metodoEjecutado: (String) -> Void        //-> clousure
        var ejcutarAlMorir: () -> Void                      // -> Clousure
        let movimiento: Movimiento = Movimiento()
        
        //Como queremos posponer al ejecución de este init, usamos el @escaping
        init(metodoEjecutado: @escaping (String) -> Void, ejcutarAlMorir: @escaping () -> Void) {
            self.metodoEjecutado = metodoEjecutado
            self.ejcutarAlMorir = ejcutarAlMorir
        }
        
        func pegar() {
            metodoEjecutado("pegar")
        }
        
        func moverse() {
            metodoEjecutado("moverse")
            movimiento.correr { [weak self] texto in      // ->   IMP: con [weak self] indicamos que la recepcion del self es débil. Lo usamos para que no se produzcan problemas de retención de memoria, el 95% de las veces
                guard self != nil else { return }                // -> para controlar que si el personaje es nulo no se ejecute el código
                print("Mi personaje \(texto)")
            }
        }
        
        func recibirDano(dmg: Int) {
            metodoEjecutado("recibirDano")
            hp -= dmg
        }
    }
    
    class Movimiento {
        var timer: Timer?
        
        func correr(intervalo: @escaping (String) -> Void) {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                intervalo("Se ha movido 10 metros")
            }
            
            //Decimos al sistema que haga un diley desde el tiempo de ahora hasta 5 segundos
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.timer?.invalidate()
            }
        }
    }
    
    //múltiple trailing clousure
    var personaje: Guerrero? = Guerrero {
        print("Se está ejecutando el método \($0)")
    } ejcutarAlMorir: {
        print("Has muerto")
    }
    
    personaje?.moverse()
    personaje?.pegar()
    personaje?.recibirDano(dmg: 50)
    personaje?.recibirDano(dmg: 500)
    personaje = nil
    
}
