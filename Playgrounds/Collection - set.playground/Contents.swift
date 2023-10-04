import UIKit

var set0: Set<Int> = Set(arrayLiteral: 1, 2, 3, 4)
var set1: Set<Int> = Set ()
var set2: Set<Int> = []
var set3: Set = [1, 2, 3, 4, 5, 6]
var set4 = Set(arrayLiteral: 1, 2, 3, 4, 5)
var set5 = Set(arrayLiteral: 4, 5, 7, 6, 2, 3, 1)

set3.update(with: 7)
set3.update(with: 1)  //no nos incluye otro 1, evitamos duplicidad

print(set3)

for item in set3 {
    print(item)
}

//set3.removeFirst()
//set3.removeAll()
//set3.remove(at: set3.firstIndex(of: 3)!)   //para eliminar el numero de la posicion 3
//set3.remove(7) //eliminamos el numero 7

print(set3)

//Comparamos sets:
if set3 == set4 {
    print("Son iguales")
}else {
    print("Son distintos")
}    //nos compara si tiene los mismos elementos en el orden que sea


if set3 == set5 {
    print("Son iguales")
}else {
    print("Son distintos")
}

if set3.contains(4) {
    print("Tiene 4 elementos")
}else {
    print("No tiene 4 elementos")
}






