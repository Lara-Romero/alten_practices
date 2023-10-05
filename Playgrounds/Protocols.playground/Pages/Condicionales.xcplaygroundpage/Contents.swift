
import Foundation

protocol Container {
    associatedtype Item
    var array: [Item] { get }
    func imprimir()
}

struct Almacen<Item> {
    var array: [Item]
}

extension Almacen: Container {
    func imprimir() {
        print("No imprimo nada")
    }
}

extension Almacen where Item: Numeric {              //lo sustituyo cuando el item es numérico
    func pintaNumeros() {
        array.forEach {
            print("Número: \($0)")
        }
    }
}

extension Almacen where Item: StringProtocol {
    func imprimir() {
        print("No imprimo nada")
    }
}

var almacen1 = Almacen(array: [1, 2, 3, 5])
var almacen2 = Almacen(array: ["Hello", "World"])

almacen1.pintaNumeros()
// almacen2.   -> como no se cumple la condicion aquí no podemos utilizar pintaNumeros()

almacen1.imprimir()        //SEgún el tipo de dato que usemos nos implementa la función (ln: 7) o el protocolo (ln: 27)
almacen2.imprimir()
