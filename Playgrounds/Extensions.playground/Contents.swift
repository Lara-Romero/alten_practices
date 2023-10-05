import UIKit

class Persona {
    var nombre: String
    var apellidos: String
    var etapa: Etapa = .bebe
    
    //este sería el constructor, podemos crear otros, pero este siempre tiene que estar
    init(nombre: String, apellidos: String) {
        self.nombre = nombre
        self.apellidos = apellidos
    }
}

extension Persona {         // Las extensiones nos permiten crear variables y métodos para completar la funcionalidad del tipo de dato que estemos trabajando
//    var dni: String = "" <- No se permite variables almacenadas
    
    //Permiten inicializadores
    convenience init() {
        self.init(nombre: "", apellidos: "")
    }
    
    var nombreCompleto: String {      //<- Permiten variables computadas
        "\(nombre) \(apellidos)"
    }
    
    func nombreCompletoMayusculas() -> String {
        nombreCompleto.uppercased()
    }
    
    //lo creamos dentro de persona y así ya queda implícito Persona.Etapa.
    enum Etapa {
        case bebe
        case adolescente
        case adulto
        case viejo
    }
}

extension Persona: Equatable {
    static func == (lhs: Persona, rhs: Persona) -> Bool {
        return lhs.nombre == rhs.nombre &&
        lhs.apellidos == rhs.apellidos &&
        lhs.etapa == rhs.etapa
    }
}

//struct Util {
//    static func nombreCompleto(persona: Persona) -> String {
//        "\(persona.nombre) \(persona.apellidos)"
//    }
//}
// ESTO ASÍ NO SE USA EN ESTE LENGUAJE, USAMOS EXTENSIONES

var persona1 = Persona(nombre: "Rafael", apellidos: "Fernández")
//print(Util.nombreCompleto(persona: persona1))

print(persona1.nombreCompleto)
print(persona1.nombreCompletoMayusculas())

var etapa1 = Persona.Etapa.adulto

var persona2 = Persona(nombre: "Rafael", apellidos: "Fernández")

//El operador == podemos usarlo usando PROTOCOLOS
if persona1 == persona2 {
    print("Es la misma persona")
} else {
    print("Son personas diferentes")
}

print("========")

//Para poder convertir tipos de datos y poder asignar valores con tipos de datos diferentes, usamos la extensión StringRepresentable
protocol StringRepresentable {
    var texto: String { get }
}

extension Int: StringRepresentable {
    var texto: String {
        String(self)
    }
}

var numero: Int = 1
var texto: String = numero.texto
print(texto)

extension Double: StringRepresentable {
    var texto: String {
        "\(self)"
    }
}
var numeroDecimal: Double = 4.3
print(numeroDecimal.texto)

print("========")

//Con esto, podemos tener un array mezclando tipos de datos y usar sus funcionalidades
var array: [StringRepresentable] = [1, 2, 6, 3.4, 1.2, 99.331]

array.forEach {
    print($0.texto)
}
