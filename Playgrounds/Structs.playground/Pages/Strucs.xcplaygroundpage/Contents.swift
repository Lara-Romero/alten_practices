import UIKit

do{
    struct PruebaStruct {
        var nombre = "Lara"
    }
    
    var prueba1 = PruebaStruct()
    var prueba2 = prueba1  // SE crea una copia del valor
    print(prueba1.nombre)
    print(prueba2.nombre)
    
    prueba1.nombre = "Miguel"
    print(prueba1.nombre)
    print(prueba2.nombre)
}

print("\n")


do {
    struct StructNivel1 {
        struct StructNivel2 {
        }
    }
    
    var nivel1 = StructNivel1()
    var nivel2 = StructNivel1.StructNivel2()
}

//No existe la herencia en los structs. por lo tanto el concepto super. tampoco

print("\n")


do{
    struct Persona {
        var nombre: String
        var apellidos: String
        
        //Memberwise inicializer: Si no hay ningún init el sistema nos crea uno.
        //No hace falta el init, porque la estructura es capaz de crear un método init con todas las propiedades qie requiere para su inicialización
        
        //Si quisiéramos crearlo de todas formas:
        init() {
            nombre = "Pepito"
            apellidos = "Pérez López"
        }
        
        init(nombre: String, apellidos: String) {
            self.nombre = nombre
            self.apellidos = apellidos
        }
    }
    var persona1 = Persona(nombre: "Lara", apellidos: "Romero Ramírez")
    print(persona1.nombre)
}

print("-------------------------------------")

do {
    struct PruebaStruct {
        var nombre = "LAra"
        static var numeroIteraciones = 9
    }
    
    print(PruebaStruct.numeroIteraciones)
    
    //Para usar nombre:
    let result = PruebaStruct()
    print(result.nombre)
}


print("\n")

do{
    struct Persona {
        var nombre: String
        var apellidos: String
    }
    
    //Si en vez de var le pusieramos let, no podríamos hacerlo
    var persona1 = Persona(nombre: "Manolo", apellidos: "Gómez")
    persona1.nombre = "Miguel"
    print(persona1.nombre)
}

print("\n")


//El struct está pensado para que cuando se crea, no se pueda modificar
do{
    struct Persona {
        var nombre: String
        var apellidos: String
        
        //No podríamos cambiar los parámetros de forma natural, solamente si usamos el término mutating delante de la función, nos deja utlizarla:
        mutating func CambiaNombreYApellidos(nombre: String, apellidos: String) {
            self.nombre =  nombre
            self.apellidos = apellidos
        }
    }
    
    var persona1 = Persona(nombre: "Carlos", apellidos: "T B")
    print(persona1.nombre)
    persona1.CambiaNombreYApellidos(nombre: "Carla", apellidos: "E F")
    print(persona1.nombre)
    
    //No podemos hacerlo con una constante, ya que le decimos que es mutating, que ya de por sí quiere decir que se puede modificar
    //    let persona2 = Persona(nombre: "Carlos", apellidos: "T B")
    //    print(persona2.nombre)
    //    persona2.CambiaNombreYApellidos(nombre: "Carla", apellidos: "E F")    <- ESta linea da fallo al compilar
    //    print(persona2.nombre)
}

print("\n")

//Extensiones, nos permiten añadir funcionalidas, tanto variables como funciones. Se usan de la misma forma que en las clases
protocol Humano {
    var nombreCompleto: String {get}
}

struct Persona {
    var nombre: String
    var apellidos: String
}

extension Persona: Humano {
    var nombreCompleto: String {
        return "\(nombre) \(apellidos)"      //como es solo una línea, podemos obviar la palabra return
    }
}

let persona1 = Persona(nombre: "Alejandro", apellidos: "López")
print(persona1.nombreCompleto)


print("-----------------")
//Arrays
let array: [Humano] = [
    Persona(nombre: "Persona 1", apellidos: "Apellidos 1"),
    Persona(nombre: "Persona 2", apellidos: "Apellidos 2"),
    Persona(nombre: "Persona 3", apellidos: "Apellidos 3")
]

array.forEach { humano in
    humano.nombreCompleto
}

print("-----------------")
// si quiero acceder al nombre solo, tengo que hacer un downcasting
array.forEach { humano in
    if let persona = humano as? Persona {
        print(persona.nombre)
    }
    
    if humano is Persona {
        print("Es persona")
    }
}





