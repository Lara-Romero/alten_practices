import UIKit

do{
    enum PruebaEnum {
        case opcion1
        case opcion2
        case opcion3
    }
    
    //Para inicializarlo:
    //var prueba1: PruebaEnum = PruebaEnum.opcion1  //Como está doblemente indicado podemos obviar el segundo
    var prueba1: PruebaEnum = .opcion1
    var prueba2 = prueba1
    print(prueba1)
    print(prueba2)
    
    //Observamos que son tipos por valor, ya que opción 1 vuelve a tener el valor inicial
    prueba1 = .opcion2
    print(prueba1)
    print(prueba2)
}


//Ejemplo de usos para enums. Vemos que tiene parámetros cerrados, es decir, los que tiene son los que podemos usar:
do{
    enum Direccion {
        case norte
        case sur
        case este
        case oeste
    }
    
    let direccion: Direccion = .sur
    
    //Vemos como lo usamos: SWICTH
    switch direccion {
    case .norte:
        print("Ha elegido Norte")
    case .sur:
        print("Ha elegido Sur")
        //fallthrough  <- Si ponemos esto, lo que hace es seguir recorriendo el código (cosa que no hace swicht de por sí) aunque ya haya encontrado el case que vale
    case .este:
        print("Ha elegido Este")
    case .oeste:
        print("Ha elegido Oeste")
    }
    
    //Utilizando if:
    if direccion == .oeste {
        print("Es correcto")
    }else {
        print("Es otra direccion")
    }
    
    
//USando default
    switch direccion {
    case .norte:
        print("Ha elegido Norte")
    default:
        print("Es otra dirección que no controlo")
    }
}

print("=======================")

//Podemos crear enums anidados, también detro de una clase o dentro de un struct:
do {
    struct Noticia {
        enum Tipo{
            case noticia
            case deporte
            case política
            case opinión
        }
        var titulo: String
        var autor: String
        var tipo: Tipo
    }
    
    //acceder al enumerador:
    var tipo1: Noticia.Tipo = .deporte
    
    print(tipo1)
}

print("=======================")

do {
    struct Noticia {
        //Los enumerados pueden ser de un tipo de dato: enum Tipo: String, Int...
        enum Tipo: String {
            case noticia = "n"
            case deporte = "d"
            case política = "p"
            case opinion = "o"
        }
        var titulo: String
        var autor: String
        var tipo: Tipo
    }
    
    //acceder al enumerador:
    var tipo1: Noticia.Tipo = .opinion
    
    //rawValue = es el valor real del enumerador
    print("El tipo de la noticia es \(tipo1.rawValue)")
    
}

print("=======================")

do {
    struct Noticia {
        //Los enumerados pueden ser de un tipo de dato: enum Tipo: String, Int...
        enum Tipo: Int {
            case noticia = 1
            case deporte = 23
            case política = 5
            case opinion = 98
        }
        var titulo: String
        var autor: String
        var tipo: Tipo
    }
    
    //acceder al enumerador:
    var tipo1: Noticia.Tipo = .deporte
    
    //rawValue = es el valor real del enumerador
    print("El tipo de la noticia es \(tipo1.rawValue)")
}


print("=======================")

//Más funcionalidades:
//ESTo de poner parámetros, nos da una amplitud enorme:
do {
    enum Direccion {
        case norte(latitud: Double, longitud: Double)
        case sur(latitud: Double, longitud: Double)
        case este(latitud: Double, longitud: Double)
        case oeste(latitud: Double, longitud: Double)
        case none
    }
    
    var direccion1 = Direccion.norte(latitud: 3.2222, longitud: 55.444444)
    
    //Cómo hacemos un swich sobre esto:
    switch direccion1 {
        //Nos lo autocompleta como case.norte(latitud: let latitud, longitud: let longitud) -> nosotros tenemos que quitarle las propiedades de la izquierda:
    case .norte(let latitud, let longitud):
        print("Norte: \(latitud), \(longitud)")
    case .sur(let latitud, let longitud):
        print("Sur: \(latitud), \(longitud)")
    case .este(let latitud, let longitud):
        print("Este: \(latitud), \(longitud)")
    case .oeste(let latitud, let longitud):
        print("Oeste: \(latitud), \(longitud)")
    case .none:
        print("Sin rumbo")
    }
}

print("=======================")

do {
    enum TipoNoticia {
        case opinion
        case deporte
        case politica
        //Los enum no permiten la creación de variables almacenadas: var nombre: String
        //Pero sí podemos crear funciones:
        func tipoNoticia() -> String {
            switch self {
            case .opinion:
                return "Soy del tipo Opinión"
            case .deporte:
                return "Soy del tipo Deporte"
            case .politica:
                return "Soy del tipo Poítica"
            }
        }
    }
    
    var result1 = TipoNoticia.opinion
    print(result1)
    print(result1.tipoNoticia())
}


print("=======================")

protocol RepresentableEnTexto {
    func texto() -> String
}

enum TipoPelicula {
    case accion
    case terror
    case animacion
}

extension TipoPelicula: RepresentableEnTexto {
    func texto() -> String {
        switch self {
            
        case .accion:
            return "Es una película de acción"
        case .terror:
            return "Es una película de terror"
        case .animacion:
            return "Es una película de animación"
        }
    }
}

var pelicula1 = TipoPelicula.terror
print(pelicula1.texto())

var pelicula2: RepresentableEnTexto = TipoPelicula.animacion
print(pelicula2.texto())
    
