
import Foundation

protocol Caminar {
    func caminar()
}

extension Caminar {
    func caminar() {
        print("Caminando voy desde el protocolo")
    }
}

struct Persona: Caminar {
//    func caminar() {
//        print("Caminando voy")              No nos haría falta implementar esta función porque la hemos implementado en el protocolo
//    }
}

let persona = Persona()
persona.caminar()
