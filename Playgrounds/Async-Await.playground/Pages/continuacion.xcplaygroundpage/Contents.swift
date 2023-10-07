import UIKit


class ObtenerDatos {
    
    func obtenerListado(completion: (String) -> Void) {
        //Este proceso tarda 5 segundos
        completion("Devuelto")
    }
    
    func obtenerListadoAsync() async -> String {
//        withCheckedThrowingContinuation(<#T##body: (CheckedContinuation<T, Error>) -> Void##(CheckedContinuation<T, Error>) -> Void#>)
        return await withCheckedContinuation { continuation in
            obtenerListado { respuesta in
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

repositorio.obtenerListado { respuesta in
    print(respuesta)
}

Task {
    print(await repositorio.obtenerListadoAsync())
}

