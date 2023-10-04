import UIKit

//Modificadores del lenguaje swift para limitar el acceso a las funciones, variables, clases para que no sean
// visibles desde ciertas partes del programa

/*
 public
 internal
 file private
 private
 */

//Si no ponemos nada el valor por defecto que tendrían sería: INTERNAL
//En lo siguiente es lo mismo poner internal que no ponerlo
internal var hola = "Hello World"
internal func saluda ( ) { }
internal class FueraClase { }
internal struct PruebaStruct { 
    private func miFuncion () {}
    fileprivate func miOtraFuncion ( ) { }
}
internal typealias Pepito = String







