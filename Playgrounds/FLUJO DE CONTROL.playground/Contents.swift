import UIKit

//RETURN
do {
    func decirHola () -> Void {
        print("Hola")
        return; //el return finaliza y corta el flujo, se añade ; para que separe con la linea siguiente
        
        print("Mundo")
    }
    decirHola()
    
    func devuelveEntero () -> Int {
        return Int.random(in: 1...100)// te devuelve el int y no sigue
        print("Devolviendo número")
    }
    print(devuelveEntero())
}
//en un switch el caso escogido tiene un return y a partir de ahi no se ejecuta nada más

func devuelveString (opcion: Int) -> String {
    switch opcion {
    case 1:
        return "Es un uno"
    case 2:
        return "Es un dos"
    default:
        return  "no se lo que es"
    }
    print("devolviendo String")
}

print(devuelveString(opcion: 2))
print(devuelveString(opcion: 3))

//----------------------------
print("------------------------")

//THROW
do {
    struct Errortexto: Error {
        
    }
    func devuelveTexto() throws -> String {
        throw Errortexto()
        return "Texto"
    }
    do {
        print(try devuelveTexto())
    }catch {
        print(error)
    }
}
//----------------------------
print("------------------------")

//IF

//GUARD es como un if else pero sería poner el else directamente
do {
    func saluda(nombre: String?) {
        guard let nombre = nombre else {
            return
        }
        print("Hola \(nombre)")
    }
    saluda(nombre: "Rafa")
    saluda(nombre: nil)
}

//----------------------------
print("------------------------")

//WHILE
//a la sentencia se le puede poner un nombre
do {
    var i = 0
    while (i < 10) {
        print("while: \(i)")
        i += 1
    }
    print("--------")
    i = 0
miBucle: while (i < 10) {
    print("while: \(i)")
    i += 1
    if i == 5 {
        break miBucle
    }
}
}
//----------------------------
print("------------------------")

//CONTINUE se le indica para que continue con el siguiente bloque
do {
    //    var i = 0
    //    while (i < 10) {
    //        if i % 2 == 0 {//si esto es par continua
    //            i += 1
    //
    //            continue
    //        }
    //        print("impares: \(i)")
    //
    //    }
    //    print("--------")
    //     i = 0
    //miBucle: while (i < 10) {
    //        print("while: \(i)")
    //        i += 1
    //        if i == 5 {
    //            break miBucle
    //        }
    //    }
}

//----------------------------
print("------------------------")
//REPEAT WHILE (seria do while) ejecuta almenos 1 vez
do {
    var i = 20
    repeat {
        print("repeat: \(i)")
        i += 1
    } while( 1 > 10) //primero se ejecuta una vez y luego comprueba la condicion
}
print("------------------------")
// FOR IN
do {
    let array = [1, 2, 3, 4, 5, 6]
    for element in array {
        print("for: \(element)")
    }
    for element in 0...10 {
        print("rango \(element)")//rango cerrado
    }
    for element in 0..<10 {
        print("rango \(element)")//rango abierto
    }
}

print("------------------------")
// DEFER una vez termines la funcion haz esto {contenido}
do {
    func decirHola() {
        print("Hola")
        print("Mundo")
        defer {
            print("Ha terminado la funcion")
            
        }
        print("algo nuevo")
    }
    decirHola()
}

print("------------------------")
//SWITCH se utiliza para los casos numerados
do {
    enum Direccion {
        case norte
        case sur
        case oeste
        case este
    }
    var direccion = Direccion.este
    switch direccion {
        
    case .norte:
        print("es norte")
    case .sur:
        print("es sur")
        
    case .oeste:
        print("es oeste")
        
    case .este:
        print("es este")
        
    }
    switch Int.random(in: 0...5) {
    case 1:
        print("es un uno")
    case 2:
        print("es un dos")
    case 3:
        print("es un tres")
    case 4:
        print("es un cuatro")
    default:
        print("es un numero desconocido")
    }
    direccion = Direccion.norte
    
    switch direccion {
        
    case .norte:
        print("es norte")
        break//cortamos el flujo
        print("es super norte")//esto no lo imprimirá
    case .sur:
        print("es sur")
        
    case .oeste:
        print("es oeste")
        
    case .este:
        print("es este")
        
    }
    switch Int.random(in: 0..<100) {
    case 1..<50://podemos añadirle rangos
        print("es menor que 50")
    case 1..<100://podemos añadirle rangos
        print("es mayor que 50")
        
    default:
        print("es un numero desconocido")
    }
    switch "5" {//podemos hacer que escoja entre varias posibilidades
    case "r", "a", "j":
        print("es un caso controlado de tipo 1")
    case "h", "ac", "5":
        print("es un caso controlado de tipo 2")
        
    default:
        print("Desconocido")
    }
}
