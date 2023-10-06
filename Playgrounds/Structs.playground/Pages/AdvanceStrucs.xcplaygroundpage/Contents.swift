import UIKit

struct Persona {
    var nombre: String
    var apellidos: String
    
    init(nombre: String, apellidos: String) {
        self.nombre = nombre
        self.apellidos = apellidos
    }
    
    init() {
        self.init(nombre: "", apellidos: "")
    }
}


let persona1 = Persona()

//Para ver la direrencia con clases
// -----------------------------------------------------------------------------------------------------
class PersonaClass {
    var nombre: String
    var apellidos: String
    
    init(nombre: String, apellidos: String) {
        self.nombre = nombre
        self.apellidos = apellidos
    }
}

//En cada vuelta asignamos a Persona una COPIA
var arrayStruct = [Persona(nombre: "1", apellidos: "1"), Persona(nombre: "2", apellidos: "2")]
//
var arrayClass = [PersonaClass(nombre: "1", apellidos: "1"), PersonaClass(nombre: "2", apellidos: "2")]

//STRUCTS : Mucho más restrictivo a la hora de hacer cambios. HAcemos copias del array
arrayStruct.forEach {
    print($0.nombre)
}
for persona in arrayStruct {
    //persona.nombre = "PEPE"    ->   No podemos cambiarle el nombre a la principal
    var p = persona                          //TEnemos que hacer una copia a la persona para poder cambiarle el valor, el array
    p.nombre = "Rafa"                           // no sufre ningún cambio
}
arrayStruct.forEach {                       //Vemos los mismos resultados iniciales
    print($0.nombre)
}

print("==========")

//CLASS : Si hacemos cambios se cambia también los valores iniciales
arrayClass.forEach {                                    //VEmos que haciendo lo mismo en el array clases. Vemos que en el array principal SÍ
    print($0.nombre)                                          // que sufre los cambios
}
for persona in arrayClass {
    persona.nombre = "Rafa"    // -> Apuntamos a la misma dirección de memoria del array, por lo que cambiamos sus valores. Sí que
                                                //podemos usar esta sentencia
}
arrayClass.forEach {
    print($0.nombre)
}

print("==========")

struct Agrupacion {
    var algo: Bool = true
    let persona = PersonaClass(nombre: "", apellidos: "")
}

let agrupacion = Agrupacion()
//agrupacion.algo = false <- Esto no está permitido
print(agrupacion.persona.nombre)
agrupacion.persona.nombre = "María"
//agrupacion.persona = PersonaClass(nombre: "", apellidos: "")  <- Esto no está permitido
print(agrupacion.persona.nombre)



import SwiftUI

struct ListView: View {
    var nombre: Dato<String> = Dato(dato: "")
    
    //PAra simplificar esto -> Propierties wraper: @State (encapsulan el tipo de dato STring dentro del state
    // Haciendo que se use el tipo genérico
    //Son lo mismo
    @State var nombre2: String = ""
    var nombre3: State<String> = State(initialValue: "")
    //============
    
    func mostrarNombre() {
        print(nombre2)
        //_nombre2 == nombre3 <- Es el mismo tipo de acceso a la variable
        $nombre2
        print(nombre3.wrappedValue)
    }
    
    var body: some View {
        Text("Hello world")
    }
}

//Clase que encapsula un tipo
class Dato<T> {
    var dato: T
    
    init(dato: T) {
        self.dato = dato
    }
}

print("===========")
//Si el enum es cerrado y queremos añadir un caso
enum Analiticas: String {
    case listado = "Pantalla de listado"
    case detalle = "Pantalla de detalle"
}

var clave = Analiticas.detalle

print(clave.rawValue)

switch clave {
case .detalle:
    break
case .listado:
    break
}

//PAra imitar este comportamiento en los strucs:
struct AnaliticasStruct: Equatable, RawRepresentable {
    var rawValue: String
    
    static let listado: AnaliticasStruct = AnaliticasStruct(rawValue: "Pantalla de listado")
    static let detalle: AnaliticasStruct = AnaliticasStruct(rawValue: "Pantalla de detalle")
}

//Podríamos incluír los nuevos "casos" que también tenemos que incluir en el swift
extension AnaliticasStruct {
    static let filtro: AnaliticasStruct = AnaliticasStruct(rawValue: "Pantalla de filtro")
}

var claveStruct = AnaliticasStruct.listado
var claveStruct2 = AnaliticasStruct(rawValue: "aaa")

print(claveStruct.rawValue)

switch claveStruct {
case .listado:
    break
case .detalle:
    break
case .filtro:
    break
default:
    break
}
