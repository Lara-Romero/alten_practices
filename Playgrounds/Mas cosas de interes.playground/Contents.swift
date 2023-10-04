import UIKit


//Arriba o delante de la función:
@discardableResult
/*  @discardableResult  */     func guardarPersona( ) -> Bool {
    return true
}

guardarPersona()

//@objc
@objc
class PruebaClase: NSObject {
    // @obtc typealias Pepito = String    <- No se puede
    @objc var nombre: String = "Lara"
}


//defer
func saluda( ) {
    defer {
        print("-----")
        print("Bye")
        print("World")
        print("-----")
    }
    print("-----")
    print("Hello")
    print("World")
    print("-----")
}

saluda()


//do
do {
    var prueba = "Hola"
}

do{
    var prueba = "Hola"
}

//if #avalible
if #available(iOS 13, *) {
    print("Estamos en iOS 13 o superior")
}

if #available(iOS 20, *) {
    print("Estamos en iOS 20 o superior")
}  //No entra en este código porque no se cumple la versión

//if #unavalible
if #unavailable(iOS 99) {
    print("No está disponible iOS 99")
}

if #unavailable(iOS 13) {
    print("No está disponible iOS 13")  //Aquí no entrará
}
