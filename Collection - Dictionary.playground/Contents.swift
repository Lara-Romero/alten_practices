import UIKit

//Diccionario es lo mismo que poner esto:
struct Persona {
    var nombre: String
    var apellido: String
}

var dict1: Dictionary<String, String> = Dictionary(dictionaryLiteral: ("nombre", "Lara"), ("apellido", "Romero"))
var dict2: [String: String] = ["nombre": "Lara", "apellido": "Romero"]
var dict3: [Int: Double] = [:]
var dict4 = [Int: Double]()

print(dict1)
print(dict2)

//añadir datos:
dict2["dni"] = "23456780A"
print(dict2)

//sobreescribir:
dict2["nombre"] = "Juan"  //la clave es única, por lo que no se crea otra, sino que sobreescribe

print(dict2["nombre"])

for key in dict2.keys {
    print(dict2[key])
}

//añadimos valores
dict4[777] = 33
dict4[48557] = -45
dict4[777] = 87 //sobreescribimos
dict4[3] = 34
dict4[456] = 99834
dict4[345] = 124
print(dict4)

//borrar elementos: diciendo que elimine el valor de la clave
dict4.removeValue(forKey: 777)
print(dict4)

//Otra forma de itinerar sobre un diccionario
for (index, item) in dict2.enumerated() {
    print(index)
    print(item.key)
    print(item.value)
}

//Funciones útiles
dict4.forEach { (key, value) in
    print("key: \(key)")
    print("value: \(value)")
}

dict4.first
dict4.isEmpty
print(dict4.keys)
print(dict4.values)


