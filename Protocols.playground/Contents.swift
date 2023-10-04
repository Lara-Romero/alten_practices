import UIKit

protocol MiProtocolo {
    
}

//------------------------------------------
protocol DesarrolladoriOS {
    //Para usar variables en los protocolos -> si le ponemos solo get, es de solo lectura
    //Si usamos get set -> lectura y escritura { get set }
    var nombre: String { get }
    func desarrollaConSwift( )
    func leerCodigo( )
    func analizarRequisitos( )
}

struct PersonaConiOS: DesarrolladoriOS {
    var nombre: String
    
    func desarrollaConSwift() {
        print("A desarrollar con Swift \(nombre)")
    }
    
    func leerCodigo() {
        print("A leer código")
    }
    
    func analizarRequisitos() {
        print("A analizar requisitos")
    }
}
//-------------------------------------------


//------------------------------------------
protocol DesarrolladorAndroid {
    func desarrollaConKotlin( )
    func leerCodigo( )
    func analizarRequisitos( )
}

struct PersonaConAndroid: DesarrolladorAndroid {
    var nombre: String
    
    func desarrollaConKotlin() {
        print("A desarrollar con Kotlin")
    }
    
    func leerCodigo() {
        print("A leer código")
    }
    
    func analizarRequisitos() {
        print("A analizar requisitos")
    }
}
//------------------------------------------

struct PersonaMobile: DesarrolladoriOS, DesarrolladorAndroid {
    var nombre: String
    
    func desarrollaConSwift() {
        
        print("A desarrollar con Swift y más \(nombre)")
    }
    
    func leerCodigo() {
        print("A leer código")
    }
    
    func analizarRequisitos() {
        print("A analizar requisitos")
    }
    
    func desarrollaConKotlin() {
        print("A desarrollar con Kotlin")
    }
}


//Vemos funcionalidad de estos protocolos con un array en el que solo queremos gente que desarrolle con iOS:

//Si intentamos meter a una PersonaConAndroid nos dice que no se puede, porque no implementa el protocolo de DesarrolladoriOS
// var candidatos: [DesarrolladoriOS] = [PersonaConiOS(nombre: "Rafa"), PersonaConiOS(nombre: "Lara"), PersonaConAndroid(nombre: "JUAN")] -> no se puede

//Peeero si podemos meter a una PersonaMobile, porque si cumple el protocolo de DesarrolladoriOS
var candidatos: [DesarrolladoriOS] = [PersonaConiOS(nombre: "Rafa"), PersonaConiOS(nombre: "Lara"), PersonaMobile(nombre: "Arturo")]


print(candidatos)
candidatos.forEach { candidato in
    print(candidato.nombre)
    candidato.desarrollaConSwift()
}


//SE puede porque los dos cumplen el protoolo de Desarrollador iOS, porque el _Mobile cumple todo los requisitos y tiene alguno más 
var candidato: DesarrolladoriOS = PersonaConiOS(nombre: "MariPuri")
print(candidato.nombre)
candidato  = PersonaMobile(nombre: "Marta")
print(candidato.nombre)
