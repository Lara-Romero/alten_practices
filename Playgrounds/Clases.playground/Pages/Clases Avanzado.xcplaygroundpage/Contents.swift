import Foundation

class Persona {
    var nombre: String
    var apellidos: String
    var dni: String = ""
    
    class func datosPersona() -> Int {           //Este class, es estático, pero nos permite sobreescribir la función en las clases hijas
        return 4
    }
    
    var nombreCompleto: String {
        "\(nombre) \(apellidos)"
    }
    
    required init(nombre: String, apellidos: String) { //designated: Inicializamos los parámetros
        self.nombre = nombre
        self.apellidos = apellidos
    }
    
    convenience init() { // convenience
        self.init(nombre: "", apellidos: "")      //Siempre nos pide llamar al init designado (el obligatorio)
        self.dni = "Vacío"
    }
    
    func caminar() {
        print("La persona camina")
    }
}


final class Guerrero: Persona {         //El modificador final: Todas las clases que tengan el final delante, nos indican que nadie puede
                                                        //heredar de ellas
    
    weak var persona: Persona?             // weak lo usamos para hacer ARC no se incremente (no "comamos" recursos de memoria)
                                                            // hacemos que no aumente la referencia a Guerrero, en este caso
    
    override class func datosPersona() -> Int {
        return 100
    }
    
    override var nombreCompleto: String {
        "Guerrero \(nombre) \(apellidos)"
    }
    
    init(hp: Int, nombre: String, apellidos: String) {
        self.hp = hp                                                        //Inicializamos la vida
        super.init(nombre: nombre, apellidos: apellidos)   //llamamos al init designado de la superclase Persona
    }
    
    convenience init?(hp: Int) {                                            //Inicializador falible: el resusltado es opcional, porque puede fallar
        guard hp > 0 else { return nil }                                   //guard: "aségurate de que" la vida sea >0 sino nulo
        self.init(hp: hp, nombre: "", apellidos: "")
    }
    
    required init(nombre: String, apellidos: String) {              //Si queremos que cuando llamemos a Guerrero nos incluya la vida junto con
        self.hp = 50                                                                //nombre y apellidos, tenemos que crear este init
        super.init(nombre: nombre, apellidos: apellidos)
    }
    
    override func caminar() {                 //override: nos permite sobreescribir la función (en este caso) de la clase padre
        print("El guerrero camina")
    }
}


var guerrero1 = Guerrero(hp: 100)
var guerrero2 = Guerrero(hp: -20)

//Comparamos clases (identidades):
if guerrero1 === guerrero2 {
    print("Es la misma")
} else {
    print("No es la misma")
}


if guerrero1 !== guerrero2 {
    print("!==: No es la misma")
} else {
    print("!==: Es la misma")
}

//Ahora como tenemos más de un método de cada clase, tenemos que ir eligiendo cuál es el que tenemos que usar en cada caso

var guerrero3 = Guerrero(hp: 100, nombre: "Marta", apellidos: "García")
var persona1 = Persona(nombre: "Laura", apellidos: "Álvarez")

print(guerrero3.nombreCompleto)
print(persona1.nombreCompleto)

print(Persona.datosPersona())
print(Guerrero.datosPersona())
