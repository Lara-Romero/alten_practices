import UIKit


//variables almacenadas : nos permiten tanto obtener el valor de la varible como settear un valor a variable
do{
    class Persona {
        var nombre: String = ""     //<- stored propierties (variables almacenadas)
        var apellidos: String = ""
    }
    
    let persona1 = Persona()
    
    persona1.nombre = "Rafael"
    print(persona1.nombre)
}

print("============")

do{
    class Persona {
        var nombre: String = "Miguel"                //<- stored propierties (variables almacenadas) : Cuando creamos la clase, ya se asigna la variable y los valores
        var apellidos: String = "A. H."                //<- stored propierties
        lazy var dni: String = "898776664S"     // <- lazy stored propierties : No se crea la asignación a no ser que usemos esta variable
        var nombreCompleto: String {              // <- computed propiertis : hacemos un tipo de función en la variable, que no recibe parámetros y que nos devuelve un valor
            return "\(nombre) \(apellidos)"
        }
    }
    
    let persona1 = Persona()
    
    persona1.nombre = "Rafael"
    // persona1.nombreCompleto = "Pepe López"  <- esto no se puede hacer, no podemos asignarle datos de esta manera. es una variable SOLO DE TIPO LECTURA
    
    print(persona1.nombre)
    print(persona1.dni)      // <- Aquí cuando la usamos es cuando se le da la asignación
    print(persona1.nombreCompleto)
}

//Podemos crear las computer proierties para que sean asignadas
print("============")

do{
    class Persona {
        var nombre: String = "Miguel"                //<- stored propierties (variables almacenadas) : Cuando creamos la clase, ya se asigna la variable y los valores
        var apellidos: String = "A. H."                //<- stored propierties
        lazy var dni: String = "898776664S"     // <- lazy stored propierties : No se crea la asignación a no ser que usemos esta variable
        var nombreCompleto: String {              // <- computed propiertis : hacemos un tipo de función en la variable, que no recibe parámetros y que nos devuelve un valor
            get {
                return "\(nombre) \(apellidos)"
            }
            set {
                var array = newValue.split(separator: " ").map { String($0) }
                if let first = array.first {
                    nombre = first
                }
                array.removeFirst()
                apellidos = array.joined(separator: " ")
            }
        }
    }
    
    let persona1 = Persona()
    
    persona1.nombre = "Rafael"
    // persona1.nombreCompleto = "Pepe López"  <- esto no se puede hacer, no podemos asignarle datos de esta manera. es una variable SOLO DE TIPO LECTURA
    
    print(persona1.nombre)
    print(persona1.dni)      // <- Aquí cuando la usamos es cuando se le da la asignación
    print(persona1.nombreCompleto)
}


print("============")


let ponerBienNombre = true

class Persona {
    // var nombre: String = "Miguel"                //<- stored propierties (variables almacenadas) : Cuando creamos la clase, ya se asigna la variable y los valores
    // var nombre: String = Persona.nombrePorDefecto
    var nombre: String = {
        let result: String
        if ponerBienNombre {
            result = "Rafael"
        } else {
            result = "Miguel"
        }
        return result
    }()
    //Propierty observed:
    var apellidos: String = "A. H." {            //<- stored propierties
        willSet {                                          // se ejecuta antes de asignar el valor a apellidos
            print("willSet: \(newValue)")
        }
        didSet {                                          // se ejecuta después de asignar el valor
            print("didSet: \(oldValue)")
        }
    }
    lazy var dni: String = "898776664S"     // <- lazy stored propierties : No se crea la asignación a no ser que usemos esta variable
    var nombreCompleto: String {              // <- computed propiertis : hacemos un tipo de función en la variable, que no recibe parámetros y que nos devuelve un valor
        return "\(nombre) \(apellidos)"
    }
    
//    public static func nombrePorDefecto() -> String {       -> Sería como el if de ponerBienNombre, pero con una función
//        let result: String
//        if ponerBienNombre {
//            result = "Rafael"
//        } else {
//            result = "Miguel"
//        }
//        return result
//    }
}
    
let persona1 = Persona()

persona1.apellidos = "Fernandez"
    
print(persona1.nombre)
print(persona1.dni)      // <- Aquí cuando la usamos es cuando se le da la asignación
print(persona1.nombreCompleto)


print("============")









