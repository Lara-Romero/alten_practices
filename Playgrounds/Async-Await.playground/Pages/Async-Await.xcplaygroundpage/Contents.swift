import UIKit

//funcion que consulta informacion de forma asincrona
func devuelveSaludo() async -> String {//le indicamos que es una funcion asincrona
    //imaginemos que aqui ocrurre algo que tarda mucho tiempo
    return "Hello World"
}
print("Antes")

Task {//dentro de este contexto funciones asincronas
    print(await devuelveSaludo())//en las funciones asincronas requieren del await para ejecutarse

}

print("Después")
