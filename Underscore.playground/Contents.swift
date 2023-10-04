import UIKit

//El underscore lo ponemos como "_"
_ = "Hello, playground"

//Ejemplo
func guardaPersona( ) -> Bool {
    //lógica de guardado
    return true
}

//guardaPersona()   //esto en un proyecto daría error, porque no estaríamos usando el dato

//Para eliminar este warning:

_ = guardaPersona()

//let result = guardaPersona( )      -> esto también daría warning en un proyecto, ya que asignamos variable que no usamos:

//Otro ejemplo

func mostrarNombre (n nombre: String) {
    print(nombre)
}
mostrarNombre(n: "Lara")

func mostrarNombre1 (_ nombre: String) {
    print(nombre)
}
mostrarNombre1("Lara")

//En tuplas:
("Lara", "Romero")

let(nombre, _) = ("Lara", "Romero")


