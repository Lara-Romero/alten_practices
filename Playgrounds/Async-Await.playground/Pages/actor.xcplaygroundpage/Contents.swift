import UIKit



struct Persona {
    var nombre: String {
        didSet {
            continuation?.yield("Nuevo nombre \(nombre)")
        }
    }
    
    var apellidos: String {
        didSet {
            continuation?.yield("Nuevos apellidos \(apellidos)")
        }
    }
    
    var continuation: AsyncStream<String>.Continuation?
    
    mutating func createStream() -> AsyncStream<String> {
        //AsyncThrowingStream
        return AsyncStream(String.self) { continuation in
            self.continuation = continuation
            
            continuation.onTermination = { termination in
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
////            continuation.yield("Prueba")
////            continuation.yield("Prueba 2")
////            continuation.yield("Prueba 3")
//            continuation.finish()
        }
    }
    
    mutating func cancelStream() {
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

