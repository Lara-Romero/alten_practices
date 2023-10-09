import UIKit

//Es como el asyncsequence pero con más complejidad
//Nos permite crear una secuencia de datos que se están enviando de forma constante, que es asíncrona, de
// forma más controlada que con el asyncsequence
struct Persona {
    var nombre: String {
        didSet {
            continuation?.yield("Nuevo nombre \(nombre)")
        }   //Cada vez que se cambie el nombre, le mandamos el nuevo nombre
    }
    
    var apellidos: String {
        didSet {
            continuation?.yield("Nuevos apellidos \(apellidos)")
        }    //Igual pero con los apellidos
    }
    
    var continuation: AsyncStream<String>.Continuation?
    
    mutating func createStream() -> AsyncStream<String> {
        //AsyncThrowingStream -> el que permite lanzar excepciones
        return AsyncStream(String.self) { continuation in     //la variable continuation
            self.continuation = continuation
            
            continuation.onTermination = { termination in    // termination es un enum que indica que puede haber
                                                                //casos
                switch termination {
                case .finished:
                    print("Fin del stream finished")
                case .cancelled:
                    print("Fin del stream cancelled")
                @unknown default:
                    print("Fin del stream")
                }
            }
//
//            for count in 0...100 {
//                continuation.yield("Vuelta \(count)")
//            }
////            continuation.yield("Prueba")    -> lo que queremos enviar
////            continuation.yield("Prueba 2")
////            continuation.yield("Prueba 3")
//            continuation.finish()    -> PAra terminarlos
        }
    }
    
    mutating func cancelStream() {    //Si Cancelamos el lanzar nombre, nos manda al task
        continuation?.finish()
        continuation = nil
    }
}

var persona = Persona(nombre: "Rafael", apellidos: "Fernández")

Task {
    for await texto in persona.createStream() {
        print(texto)
    }
    
    print("Terminado")
}

print("\(persona.nombre) \(persona.apellidos)")
persona.nombre = "Miguel"
print("\(persona.nombre) \(persona.apellidos)")
persona.apellidos = "García Lorca"
persona.cancelStream()
persona.nombre = "Ana"

