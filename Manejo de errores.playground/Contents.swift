import UIKit

func prueba() throws -> String {
    return "Hello World"
}

//Protocol: Error    -> para que haya un error tenemos que crearnos cualquier dato con el protocolo error
struct MiErrorStruct: Error {
    var description: String
}

func pruebaConError() throws -> String {
    throw MiErrorStruct(description: "Ha ocurrido un error desconocido")
    return "Hello World"
}

//Otra forma de crear un error:
enum ErrorApp: Error {
    case desconocido
    case errorString
}

func pruebaConOtroError() throws -> String {
    throw ErrorApp.desconocido
    return "Hello World"
}


print(try prueba())   //<- Aquí tenemos que controlar el error que nos puede lanzar, que se hace poniendo try antes de la llamada a la función


//lo asignamos a una variable
struct Test {
    static func llamarAPrueba() {
        let result = try? prueba()
        print(result)
    }
    
    static func llamarAPrueba2() {
        do {
            let result = try? prueba()
            print(result)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func llamarAPrueba3() {
        do {
            let result = try pruebaConError()
            print(result)
        } catch {
            print(error)
        }
    }
    
    static func llamarAPrueba4() {
        do {
            let result = try pruebaConOtroError()
            print(result)
        } catch ErrorApp.errorString {
            print("Entra en este control de error")
        } catch {
            if let error = error as? ErrorApp {
                switch error {
                case .desconocido:
                    print("Desconocido")
                case .errorString:
                    print("Mal String")
                }
            }
            print(error)
        }
    }
}

Test.llamarAPrueba()
Test.llamarAPrueba2()
Test.llamarAPrueba3()
Test.llamarAPrueba4()

print("======================")

do {
    if let url = URL(string: "http:\\google.es") {
        _ = try Data(contentsOf: url)
        print("Es correcto")
    }
} catch {
        print(error)
}


do {
    if let url = URL(string: "kkjdjgaifhudi") {
        _ = try Data(contentsOf: url)
        print("Es correcto")
    }
} catch {
    print(error)
}

