import UIKit

// class, struct, enum, func <- Se pueden usar
// protocol <- No se pueden usar. En su lugar se usan los `associatedtype`

class EjemploClase<Item> {
    var param: Item?
}

class ClaseNoEquatable {
    
}

struct EjemploStruct<U: Equatable> {
    var param: [U]?
}

struct EjemploStruct2<U> where U: Equatable {
    var param: [U]?
}

enum EjemploEnum<Cosa> {
    case caminar(Cosa)
    case parar
}

//LE asignamos el protoclo necesario y podemos usar todos sus métodos
func saluda<T: StringProtocol>(_ param: T) {
    if param == "1" {
        print("Es 1")
    } else {
        print("No es 1")
    }
}

saluda("1")

var arrayStruct = EjemploStruct(param: [1, 2])
//var arraStruct2 = EjemploStruct(param: [ClaseNoEquatable()]) <- Esto no se permite

var clase1 = EjemploClase<Int>()
var clase2: EjemploClase<String> = EjemploClase()

var enum1 = EjemploEnum.caminar("")
var enum2: EjemploEnum<Int> = EjemploEnum.parar

print("=============")

//Restricciones
protocol Container {
    associatedtype Item
    
    var items: [Item] { get }
    mutating func append(_ item: Item)
}

struct Stack<U>: Container {
    var items: [U]
    
    mutating func append(_ item: U) {
        items.append(item)
    }
    
}

struct OtroStack<U>: Container {
    var items: [U]
    
    mutating func append(_ item: U) {
        items.append(item)
        items.append(item)
    }
    
}
 //Para comparar los items de los dos protocolos
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    return someContainer.items == anotherContainer.items
}

var stack1 = Stack(items: [1, 2, 3])
var stack2 = Stack(items: ["1", "2", "3"])
var stack3 = Stack(items: [1, 2])
var stack4 = OtroStack(items: [1, 2, 3])

//allItemsMatch(stack1, stack2) // <- Esto no está permitido, los stack tienen que ser del mismo tipo
print(allItemsMatch(stack1, stack3))
print(allItemsMatch(stack1, stack4))

