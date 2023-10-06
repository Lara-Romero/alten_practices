import UIKit

var array: [Int]
var array1: Array<Int>
//Si no tuvieramos genéricos habría que tener un Array diferente para cada tipo: ArrayInt, ArrayString...


do{
    struct StackInt {
        var items: [Int]
        
        mutating func push(_ item: Int) {
            items.append(item)
        }
        
        mutating func pop() -> Int {
            return items.removeLast()
        }
    }
    
    var starkInt = StackInt(items: [1, 2, 3, 4, 5])
    starkInt.push(5)
    print(starkInt.items)
    print(starkInt.pop())
    print(starkInt.items)
    
    print("--------------------------")
    //var starkString = StackInt(items: ["1", "2", "3", "4"])   -> No se puede ya que los datos que tenemos son tipo Int, y estamos queriendo usar String.
    //Para poder usarlo tendríamos que duplicar la estrutura:
    struct StackString {
        var items: [String]
        
        mutating func push(_ item: String) {
            items.append(item)
        }
        
        mutating func pop() -> String {
            return items.removeLast()
        }
    }
    
    var starkString = StackString(items: ["1", "2", "3", "4"])
    starkString.push("5")
    print(starkString.items)
    print(starkString.pop())
    print(starkString.items)
}


print("===============")


//VAmos a hacer lo mismo, pero con solo una estructura:


struct Stack<T> {
    var items: [T]
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var starkInt = Stack(items: [1, 2, 3, 4, 5])
starkInt.push(5)
print(starkInt.items)
print(starkInt.pop())
print(starkInt.items)

print("--------------------------")

var starkString = Stack(items: ["1", "2", "3", "4"])
starkString.push("5")
print(starkString.items)
print(starkString.pop())
print(starkString.items)


print("===============")


//No tiene que ser toda la estructura genérica, también podemos tener un tipo de dato genérico solamente:
func multiplier(by multiplier: Int, number: Int) -> Int {
    return multiplier * number
}

func multiplier(by multiplier: Double, number: Double) -> Double {
    return multiplier * number
}

print(multiplier(by: 2, number: 5))
print(multiplier(by: 2, number: 5.5))

//Para no duplicar funciones, utilizamos en este ejemplo el genérico
//func multiplier<T>(by multiplier: T, number: T) -> T {
//    return multiplier * number                                            <- ESta línea nos da de error que el * no puede ser utilizado con tipo T porque todos los tipos de datos no se pueden         //                                                                                         multiplicar
//                                                                                           por ello, habría que acotar a que solo se usen tipos de datos numéricos(Int, Double, Float...) _____ Usamos
//                                                                                           PROTOCOLOS, en este caso el Numeric, que es el que hace que se cumpla esto

print("------------------------------")
func multiplier<T: Numeric>(by multiplier: T, number: T) -> T {
    return multiplier * number
}

print(multiplier(by: 2, number: 5))
print(multiplier(by: 2, number: 5.5))


print("===============")

//Dentro de una estuctura:
struct Util {
    static func multiplier<T: Numeric>(by multiplier: T, number: T) -> T {
        return multiplier * number
    }
}

print(Util.multiplier(by: 4, number: 8))


print("===============")


//EJEMPLOS PROPIOS:
print("Ejemplo 1:")
func encontrarMaximo<T: Comparable>(_ elementos: [T]) -> T? {      //<- Comparable es un protocolo de los existentes
    return elementos.max()
}

let numeros = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
let maximo = encontrarMaximo(numeros)
print(maximo)


print("===============")

print("Ejemplo 2:")
func imprimirValores<T, U>(_ valor1: T, _ valor2: U) {
    print("Valor 1: \(valor1)")
    print("Valor 2: \(valor2)")
}

// Llamada a la función con diferentes tipos de valores
imprimirValores(42, "Hola")
imprimirValores("Swift", 3.14)


print("===============")

print("Ejemplo 3:")
func combinarArrays<T, U>(_ array1: [T], _ array2: [U]) -> [Any] {
    var resultado: [Any] = []
    
    for elemento in array1 {
        resultado.append(elemento)
    }
    
    for elemento in array2 {
        resultado.append(elemento)
    }
    
    return resultado
}

let arrayDeEnteros = [1, 2, 3]
let arrayDeCadenas = ["Hola", "Mundo"]

let resultado = combinarArrays(arrayDeEnteros, arrayDeCadenas)

for elemento in resultado {
    print(elemento)
}



