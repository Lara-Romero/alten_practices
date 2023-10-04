import UIKit

//return : Finaliza el ámbito donde nos encontremos, los warnings no dicen que lo siguiente no va a ejecutarse.
do{
    func decirHola() -> Void {
        print("Hola")
        return;
        print("Hola Mundo")
    }
    
    decirHola()
    
    func devuelveNumero() -> Int {
        return Int.random(in: 1 ... 100)
        print("Devolviendo número")
    }
    
    print(devuelveNumero())
    
    func devuelveString(opcion: Int) -> String {
        switch opcion {
        case 1:
            return "Es un uno"
        case 2:
            return "Es un dos"
        default:
            return "No sé lo que es"
        }
        
        print("Devolviendo String")
    }
    
    print(devuelveString(opcion: 1))
    print(devuelveString(opcion: 3))
}

print("=================")

//throw: Corta el flujo también
do {
    struct  ErrorTexto: Error { }
    
    func  devuelveElTexto() throws  -> String {
        throw ErrorTexto()
        return "Texto"
    }
    
    do {
        print(try devuelveElTexto())
    } catch {
        print(error)
    }
}

print("=================")

// if:

do {
    if Bool.random() {
        print("Es true")
    } else {
        print("Es false")
    }
}

print("=================")

//guard -> sería como algo parecido a hacer solo el else sin el if
do {
    func saluda(nombre: String?) {
        //        if let nombre = nombre {
        //            print("Hola, \(nombre)")
        //        }
        guard let nombre = nombre else {
            return
        }
        print("Hola, \(nombre)")
    }
    
    saluda(nombre: "Lara")
    saluda(nombre: nil)
}

print("=================")

//while / break / continue
do {
    var i = 0
    
    while (i < 10) {
        print("while: \(i)")
        i += 1
    }
    
    print("------------------------------")
    
    i = 0
    // a las sentencias de tipo while podemos ponerle un nombre:
miBucle: while (i < 10) {
    print("while: \(i)")
    i += 1
    if i == 5 {
        break miBucle
    }
}
    
    print("------------------------------")
    i = 0
    while ( i < 10) {
        if i % 2 == 0 {
            i += 1
            continue
        }
        print("Impares: \(i)")
        i += 1
    }
}

print("=================")

//repeat-while   -> do while
do{
    var i = 0
    repeat {
        print("repeat: \(i)")
        i += 1
    } while(i < 10)
    
    print("------------------------------")
    i = 0
    repeat {
        print("repeat break: \(i)")
        i += 1
        if i == 5 {
            break
        }
    } while(i < 10)
    
    print("------------------------------")
    i = 0
    repeat {
        if i % 2 == 0 {
            i += 1
            continue
        }
        print("repeat continue: \(i)")
        i += 1
    } while(i < 10)
    
    print("------------------------------")
    i = 0
miBucle: repeat {
    print("repeat labeled break: \(i)")
    i += 1
    if i == 5 {
        break miBucle
    }
} while(i < 10)
}



print("=================")

//for-in
do {
    let array = [4, 6, 3, 9, 1, 2, 6, 2]
    for element in array {
        print("for: \(element)")
    }
    
    for element in 0...10 {   //-> rango cerrado
        print("for closed range: \(element)")
    }
    
    //rango abierto
    for element in 0..<10 {
        print("for closed range: \(element)")
    }
    
    for enumerated in array.enumerated() {
        print("for break: \(enumerated.element)")
        if enumerated.offset == 4 {     //hasta la posición #4
            break
        }
    }
    
    
    for enumerated in array.enumerated() {
        if enumerated.offset % 2 == 0 { continue }
        print("for continue: \(enumerated.element)")
    }
}
              
print("=================")
              
//defer -> función dentro de una función que hace que se ejecute todo lo que hay dentro se ejecute una vez se ejecute el método
do {
            func decirHola() {
                defer {
                    print("Ha terminado de ejecutar la función")
                }
                print("Hola")
                print("Mundo")
            }
            
            decirHola()
}
              
              
              
