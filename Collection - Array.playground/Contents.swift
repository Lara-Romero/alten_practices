import UIKit

//Formas de crearlo
var array0: Array<Int> = Array()  //otra forma de array vacío
var array1: Array<Int> = Array(arrayLiteral: 1, 2, 3, 4)
var array2: [Int] = [1, 2, 3, 4, 1, 4]
var array3 = [1, 2, 3, 4]
//Lo inicializamos vacío
var array4: [Int] = []
var array5 = [Int]()
// No podríamos no ponerle el tipo (Int) si no le metemos valores, ya que no sabría qué tipo es



//REcorremos/ Iteramos:
for item in array2 {
    print(item)
}

print("\nSiguiente\n")

array2.forEach { item in
    print(item)
}

print("\nSiguiente\n")

for item in array2 {
    if item < 4 {
        print(item)
    }
}     //no es muy eficiente, mejor:

print("\nSiguiente\n")

array2.filter { item in
    if item < 4 {
        return(true)
    }else {
        return(false)
    }
}.forEach { item in
    print("Result: \(item)")
}

//Que nos devuelva un string personalizado;
print("\nSiguiente\n")

array2.filter { item in
    if item < 4 {
        return true
    }else {
        return false
    }
}.map { item in
    "Valor: \(item)"
}.forEach { item in
    print(item)
}

//De una forma más resumida:
print("\nSiguiente\n")

array2.filter { $0 < 4}.map {"Valor reducido: \($0)" }.forEach {print($0)}

array2.filter {
    $0 < 4
}.map {
    "Valor reducido: \($0)"
}.forEach {
    print($0)}

//Funciones interesantes:
print("\nSiguiente\n")

print (array2.count)  //número de elementos que tiene el array
print (array2 [3])   //Elemento concreto, pero puede no tener el número de elementos que le ponemos y proboca fallo, solucionamos:

print( "Indices: \(array2.indices)")
if array2.indices.contains(6) {
    print (array2[6])
}else {
    print("No lo contiene")
}

//array2.removeLast()
//array2.removeFirst()
//array2.removeAll()
//array2.remove(at: 6)  -> Siempre poniendo la condición como en el ejerciio anterior

var item = array2.first {item in
    item == 4
}
print (item)

var first = array2.first
var last = array2.last

print(array2.isEmpty)
print(array0.isEmpty)

array2.sorted()
array2.shuffled()  //genera nuevo array desordenado







    







