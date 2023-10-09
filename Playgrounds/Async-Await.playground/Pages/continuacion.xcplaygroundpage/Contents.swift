import UIKit


class ObtenerDatos {
    
    func obtenerListado(completion: (String) -> Void) {  //encasulamos la respuesta del método en un clousure
                                                        //Una vez pasen esos 5 segundos llamamos al clousre a Devuelto
        //Este proceso tarda 5 segundos
        completion("Devuelto")
    }
    
    //Para hacer lo mismo de antes de forma asíncrona:
    func obtenerListadoAsync() async -> String {
//        withCheckedThrowingContinuation(<#T##body: (CheckedContinuation<T, Error>) -> Void##(CheckedContinuation<T, Error>) -> Void#>)
        return await withCheckedContinuation { continuation in
            obtenerListado { respuesta in     // cuando tenga el string que queremos devolver, pasa a continuation
                continuation.resume(returning: respuesta)
            }
        }
    }
    
    func obtenerListadoMalo() -> String {
        //Este proceso tarda 5 segundos
        return "Devuelto Malo"
    }
    
    func obtenerDetalle() {
        
    }
}


var repositorio = ObtenerDatos()

print(repositorio.obtenerListadoMalo()) // <- Si esto tarda 5 segundos, estamos bloqueando el hilo durante ese tiempo
                                        // Bloquearía la app durante esos 5 segundos

//Llamamos a la función con clousure
repositorio.obtenerListado { respuesta in
    print(respuesta)
}


//Con esto la podemos llamar a la función sin que se pare esos 5 segundos
Task {
    print(await repositorio.obtenerListadoAsync())
}

