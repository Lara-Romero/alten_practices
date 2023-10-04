import UIKit

/* TIPOS POR VALOR -- STRUCT
 Int
 Float
 Double
 Bool
 String
 Array
 Dictionary
 */

var numero0: Int = Int(5)  //otra forma de ponerlos
var number1: Int = 4
print (number1)
Int.max
Int.min

var float0: Float = Float(5.5)
var float1: Float = 4.3 //32 bits
print (float1)
print (Float.greatestFiniteMagnitude)

var double1: Double = 10.9 //64 bits
print (double1)
print (Double.greatestFiniteMagnitude)
var double2 = 19.4
// double2.exponent    o    19.4.exponent

var bollean1: Bool = true
var bollean2: Bool = false
var bollean3 = true
print(bollean1)
print(bollean2)
print(bollean3)

//String
var string1: String = String("prueba 1")
var string2: String = "prueba 2"  //String literal
var string3 = """
Hola, mundo
qué tal?
"""  //multiline string
var string4 = "Hola\nMundo"
var string5 = string1 + " -Algo propio- " + string2
var string6 = "\(string1) -Adiós, mundo- \(string2)" // string inteRpolation
print(string1)
print(string2)
print(string3)
print(string4)
print(string5)
print(string6)

//ARRAYS
var array1: Array<String> = Array(arrayLiteral: "Alten", "mola")
var array2: [String] = ["Hola", "mundo"]
//dentro del array no podemos poner tipos de datos diferentes
for item in array2 {
    print("valor: \(item)")
}
// añadir elementos al array. dos formas:
array2.append("Adios")
array2.append("mundo")
for item in array2 {
    print("valor: \(item)")
}

array2.append(contentsOf: array1)

//eliminar elementos del array : .remove lo que queramos borrar:
//array2.removeLast()
//array2.removeFirst()
//array2.remove(at: 3)
//array2.removeAll()

print(array1)
print(array2)



//DICTIONARY
var dict1: Dictionary<String, String> = Dictionary(dictionaryLiteral: ("nombre", "Lara"), ("apellido", "Romero"))
//mejor:
var dict2: [String: String] = ["nombre": "Lara", "apellido": "Romero"]
//añadir
dict2 ["dni"] = "30493378"
//borrar
dict2.removeValue(forKey: "nombre")
//recorrer el dictionary
for key in dict2.keys {
    print(dict2[key])
}

for (index, element) in dict2.enumerated() {
    print("Index: \(index)")
    print("Key: \(element.key)")
    print("Value: \(element.value)")
}

print(dict1)
print(dict2)





