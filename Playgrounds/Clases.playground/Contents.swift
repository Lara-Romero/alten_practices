import UIKit

//Tipo por REferencia:
do {
    class PruebaClase {
        var nombre: String = "Lara"
    }
    
    var prueba1 = PruebaClase()
    var prueba2 = prueba1
    
    print(prueba1.nombre)
    print(prueba2.nombre)
    
    //Si le cambiamos el nombre a una de las variables, se cambia en las dos, porque las dos apuntan a la misma dirección de memoria
    prueba1.nombre = "Pepe"
    
    print(prueba1.nombre)
    print(prueba2.nombre)
}

print("\n")

//Las clases permiten la anidación, dentro de una podemos declarar otra
class ClaseNivel1 {
    class ClaseNivel2 {
        
    }
}

var pruebaNivel1 = ClaseNivel1()
//Para poder acceder a ClaseNivel2 tenemos que hacerlo a través de la clase principal:
var pruebaNivel2 = ClaseNivel1.ClaseNivel2()


//Las clases son el único tipo de dato que permite la HERENCIA:
protocol Season { }

do {
    class MediaItem {
        var nombre: String = "Lara"
    }
    
    class Film: MediaItem {
        var director: String = "Manolito"
    }
    
    class Song: MediaItem {
        var artista: String = "Juan"
    }
    
    //con esto, la clase Film tendrá disponible las propiedades de las variables de su clase y de la clase de la que hereda:
    var film = Film()
    print(film.director)
    print(film.nombre)
    
    //Implementamos con un protocolo, que lo tenemos que sacar del do, porque son elementos de primer nivel y no pueden estar dentro de do ni de nada.
    //El orden debe ser este, si lo ponemos al revés no da error
    class TVShow: MediaItem, Season { }
}

print("\n")

do {
    class Persona {
        //Si creamos las variables siguientes, hay que iniciarlas, porque no son opcionales, son obligatorias, o en su defecto, pornerlas como opcionales: String?
        var nombre: String
        var apellidos: String
        //CREamos nuestro propio inicializador, si no queremos que sean opcionales:
        init () {
            nombre = "Lara"
            apellidos = "Romero Ramírez"
        }
        
        //Ahora queremos asignar el nombre y apellidos de nuestro init a las de arriba, pero si usamos el mismo nombre, no se puede, se hace así:
//        init(nombre: String, apellidos: String) {
//            nombre = nombre    //nos está cogiendo el nombre de init, y queremos que coja el de var
//            apellidos = apellidos
//        }
        init(nombre: String, apellidos: String) {
            self.nombre = nombre    //usamos self (this en java)
            self.apellidos = apellidos
        }
    }
    
    var persona1 = Persona()
    print(persona1.nombre)
    print(persona1.apellidos)
    
    var persona2 = Persona(nombre: "Marta", apellidos: "López")
    print(persona2.nombre)
    
}

print("\n")


//Tipos de variables que podemos crear dentro de una clase
do{
    class PruebaClase {
        var nombre: String = "Abril"          // variable de instancia
        static var numeroIteraciones = 6    // variable estática
    }
    //Para llamar a la variable estática: nombreDeLaClase.nombreVariable:
    print(PruebaClase.numeroIteraciones)
    //Para llamar a la variable de instancia: tenemos que instanciar:
    var result = PruebaClase()
    print(result.nombre)
}

print("\n")

do {
    class MediaItem {
        var nombre: String
        
        init(nombre: String) {
            self.nombre = nombre
        }
    }
    
    //debemos hacer referencia a la clase padre, para que nos deje usar las subclases: con super.
    class Film: MediaItem {
        var director: String
        
        init(director: String, nombre: String) {
            self.director = director
            super.init(nombre: nombre)
        }
    }
    
    class Song: MediaItem {
        var artista: String
        
        init(artista: String, nombre: String) {
            self.artista = artista
            super.init(nombre: nombre)
        }
    }
    
    var film1 = Film(director: "Guillermo del Toro", nombre: "El laberinto del Fauno")
    print(film1.nombre)
}

print("\n")

protocol Humanos { }

class Persona {
    var nombre: String
    var apellidos: String
    
    init(nombre: String, apellidos: String) {
        self.nombre = nombre
        self.apellidos = apellidos
    }
}

let persona1 = Persona(nombre: "Lara", apellidos: "Romero Ramírez")

print("\(persona1.nombre) \(persona1.apellidos)")

//EXTENSIONES:
//Podemos implementar protocolos dentro de las extensiones:
extension Persona: Humanos {
    func nombreCompleto( ) -> String {
        return "\(nombre) \(apellidos)"
    }
}
//No podemos poner en las extensiones variables nuevas, irían en la clase...... Hay unas variables que sí se pueden, pero es un tema avanzado

print(persona1.nombreCompleto())


print("\n")


do {
    class MediaItem {
        var nombre: String
        
        init(nombre: String) {
            self.nombre = nombre
        }
    }
    
    class Film: MediaItem {
        var director: String
        
        init(director: String, nombre: String) {
            self.director = director
            super.init(nombre: nombre)
        }
    }
    
    class Song: MediaItem {
        var artista: String
        
        init(artista: String, nombre: String) {
            self.artista = artista
            super.init(nombre: nombre)
        }
    }
    
    let array: [MediaItem] = [
        Film(director: "Director 1", nombre: "Película 1"),
        Film(director: "Director 2", nombre: "Película 2"),
        Film(director: "Director 3", nombre: "Película 3"),
        Song(artista: "Artista 1", nombre: "Canción 1"),
        Song(artista: "Artista 2", nombre: "Canción 2"),
        Song(artista: "Artista 3", nombre: "Canción 3")
    ]
    
    array.forEach { item in
        //Downcasting:
        if let item = item as? Film {
            print("Película: \(item.director)")
        } else if let item = item as? Song {
            print("Canción: \(item.artista)")
        }
        
        if item is Film {
            print("Es una película")
        }else if item is Song {
            print("Es una canción")
        }
    }
}

print("\n")

//Identidad:
do {
    class MediaItem {
        var nombre: String
        
        init(nombre: String) {
            self.nombre = nombre
        }
    }
    
    class Film: MediaItem {
        var director: String
        
        init(director: String, nombre: String) {
            self.director = director
            super.init(nombre: nombre)
        }
    }
    
    class Song: MediaItem {
        var artista: String
        
        init(artista: String, nombre: String) {
            self.artista = artista
            super.init(nombre: nombre)
        }
    }
    
    let array: [MediaItem] = [
        Film(director: "Director 1", nombre: "Película 1"),
        Film(director: "Director 2", nombre: "Película 2"),
        Film(director: "Director 3", nombre: "Película 3"),
        Song(artista: "Artista 1", nombre: "Canción 1"),
        Song(artista: "Artista 2", nombre: "Canción 2"),
        Song(artista: "Artista 3", nombre: "Canción 3")
    ]
    
    array.forEach { item in
        //Downcasting:
        if let item = item as? Film {
            print("Película: \(item.director)")
        } else if let item = item as? Song {
            print("Canción: \(item.artista)")
        }
        
        if item is Film {
            print("Es una película")
        }else if item is Song {
            print("Es una canción")
        }
    }
    
    print("-------------")
    
    //Si creamos dos películas
    var peli1 = Film(director: "Director 1", nombre: "Película 1")
    var peli2 = Film(director: "Director 2", nombre: "Película 2")
    var peli3 = peli1
    
    //Para poder ver las referencias donde apuntan cada una de las variables:
    print(Unmanaged.passUnretained(peli1).toOpaque())
    print(Unmanaged.passUnretained(peli2).toOpaque())
    print(Unmanaged.passUnretained(peli3).toOpaque())
    //Podemos ver que la 1 y la 3 tienen la misma.
    
    if peli1 === peli2 {
        print("Es la misma referencia")
    } else {
        print("No es la misma referencia")
    }
    
    if peli1 === peli3 {
        print("Es la misma referencia")
    } else {
        print("No es la misma referencia")
    }
    
    //Any -> cualquier cosa
    //AnyObject -> Cualquier objeto, por lo tanto cualquier clase
    //Podemos meter cualquier objeto, pero no es una práctica recomendada
    var array2: [AnyObject] = [
        Film(director: "Director 1", nombre: "Película 1"),
        Film(director: "Director 2", nombre: "Película 2"),
        Film(director: "Director 3", nombre: "Película 3"),
        Song(artista: "Artista 1", nombre: "Canción 1"),
        Song(artista: "Artista 2", nombre: "Canción 2"),
        Song(artista: "Artista 3", nombre: "Canción 3")
    ]
}
