import UIKit

var a = 1
var b = 2
var c = 3

var result = a + b
var result2 = a + c

//firma: hello()
func hello() {
    print("\n")
    print("Hola")
    print("----")
    print("Mundo")
    print("\n")
}

//firma: hello2() -> Void
func hello2() -> Void {   //poniendo el return
    print("\n")
    print("Hola")
    print("----")
    print("Mundo")
    print("\n")
}

hello()
hello()


//La firma de la función es: suma(x: Int, y: Int) -> Int
func suma(x: Int, y: Int) -> Int {
    return x + y
}

var resultSuma = suma(x: 5, y: 10)
print(resultSuma)


//La firma de la función es: multiplicar(por multiplicador: Int, x: Int) -> Int
func multiplicar(por multiplicador: Int, x: Int) -> Int {      //se le pueden poner dos nombres a la funcion
    return x * multiplicador
}

//La firma de esta sería: multiplicar(algo: Int, x: Int) -> Int          La segunda palabra no importa y no podemos poner dos funciones con la misma firma
func multiplicar(algo multiplicador: Int, x: Int) -> Int {      //se le pueden poner dos nombres a la funcion
    return x * multiplicador
}

var resultMultiplicar = multiplicar(por: 2, x: 10)
print(resultMultiplicar)
