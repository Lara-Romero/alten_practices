import UIKit

// Todas estas funciones de orden superior nunca nos van a cambiar los datos iniciales de la variable inicial
var closure: (String) -> Void

// forEach
do {
    let items = [1, 5, 3, 11, 87]
    items.forEach {
        print($0)
    }
}

print("========")

// map
do {
    let items = [1, 5, 3, 11, 87]
    items.map { n in
        "Es el número \(n)"
    }.forEach {
        print($0)
    }
}

print("========")

// compactMap -> dif con el map, es que éste nos permite mapear igual que con map, pero nos devuelve un tipo de elemento que puede ser opcional
do {
    let items: [Int?] = [1, 5, nil, 3, 11, nil, 87]   //cuando recorre el nulo lo que hace es eliminarlos del array
    print(items.count)
    items.compactMap {
        if let n = $0 {
            return "Es el \(n)"
        } else {
            return nil
        }
    }.forEach {
        print($0)
    }
}

print("========")

// flatMap : separa los datos y los mete todos dentro de un único array
do {
    let items = [[1, 2], [3, 4], [8, 9]]   // -> array de arrays
    print("count: \(items.count)")
    items.flatMap {
        $0
    }.forEach {
        print($0)
    }
}

print("========")

// reduce
do {
    let items = [1, 5, 3, 11, 87]
//    let result = items.reduce(0) {
//        $0 + $1
//    }
    
//    func +(_ n1: Int, _ n2: Int) -> Int {
//
//    }
    func suma(n1: Int, n2: Int) -> Int {
        return n1 + n2
    }
    
    let result1 = items.reduce(0, suma(n1:n2:))
    let result2 = items.reduce(0, +)
    print("Suma 1: \(result1)")
    print("Suma 2: \(result2)")
}

print("========")

// filter : filtramos
do {
    let items = [1, 2, 5, 6, 3, 11, 87]
    items.filter {
        $0 % 2 == 1    //condición
    }.forEach {
        print($0)
    }
}

print("========")

// sorted: función para ordenar de mayor a menor o viceversa
do {
    let items = [1, 2, 5, 6, 3, 11, 87]
    
    items.sorted {
        $0 > $1
    }.forEach {
        print($0)
    }
}

print("========")

// contains: nos devuelve true o false en base a si el array contiene o no el elemento que le digamos
do {
    let items = [1, 2, 5, 6, 3, 11, 87]
    let result1 = items.contains {
        $0 == 11
    }
    print("Contains 1: \(result1)")
    
    let result2 = items.contains {
        $0 == 63
    }
    print("Contains 1: \(result2)")
}

print("========")

// allSatisfy: vemos si todos los elementos del array satisfacen una condición determinada
do {
    let items = [1, 2, 5, 6, 3, 11, 87]
    let result1 = items.allSatisfy {
        $0 % 2 == 0
    }
    print("AllSatisfy 1: \(result1)")
    
    let result2 = items.allSatisfy {
        $0 < 100
    }
    print("AllSatisfy 2: \(result2)")
}


print("========")

// removeAll: elimina todos los elementos que cumplan la condición que digamos. en este caso sí se modifica el array
do {
    var items = [1, 2, 5, 6, 3, 11, 87]
    items.removeAll {
        $0 % 2 == 0
    }
    items.forEach {
        print($0)
    }
}

print("========")

// drop: elimina los elementos que cumplen x condición
do {
    let items = [1, 7, 2, 5, 6, 3, 11, 87]
    items.drop {
        $0 % 2 == 1
    }.forEach {
        print($0)
    }
}

print("========")

// prefix: se muestran los elementos que cumplan true, cuando un elemento deje de cumplir la condición, deja de mostrar elementos
do {
    let items = [1, 7, 2, 5, 6, 3, 11, 87]
    items.prefix {
        $0 % 2 == 1
    }.forEach {
        print($0)
    }
}

print("========")

// first: nos muestra el primer elemento del array que cumpla la condición
do {
    let items = [1, 7, 2, 5, 6, 3, 11, 87]
    
    let result = items.first {
        $0 % 2 == 0
    }
    
    if let result = result {
        print("first: \(result)")
    }
}

print("========")

// last: nos muestra el último elemento del array que cumpla la condición
do {
    let items = [1, 7, 2, 5, 6, 3, 11, 87]
    
    let result = items.last {
        $0 % 2 == 0
    }
    
    if let result = result {
        print("last: \(result)")
    }
}

print("========")

//Podemos usarlas juntas:
do {
    let items = [1, 7, nil, 2, 5, 6, 3, nil, 11, 87]
    items.compactMap {
        $0
    }.filter {
        $0 % 2 == 1
    }.sorted {
        $0 > $1
    }.map {
        return "Es el número \($0)"
    }.forEach {
        print($0)
    }
}
