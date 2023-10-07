import UIKit

@globalActor
struct BancoActor {
    actor BancoType { }
    static let shared: BancoType = BancoType()
}

//@BancoActor
class CuentaBancaria {
    nonisolated var nombre: String { "Mi cuenta" }
    @BancoActor var saldo: Int
    
    nonisolated init(saldo: Int) {
        self.saldo = saldo
    }
    
    @BancoActor func retirarDinero(_ cantidad: Int) {
        guard (saldo - cantidad) >= 0 else { return }
        saldo -= cantidad
    }
    
    nonisolated func nombreCuenta() -> String {
        "El nombre de la cuenta es \(nombre)"
    }
}

var cuenta = CuentaBancaria(saldo: 100)

Task(priority: .background) {
    await cuenta.retirarDinero(80)
    print("Saldo 1: \(await cuenta.saldo)")
    print(cuenta.nombre)
    print(cuenta.nombreCuenta())
}

Task(priority: .background) {
    await cuenta.retirarDinero(100)
    print("Saldo 2: \(await cuenta.saldo)")
}


@MainActor
class MostrarListado1 {
    
    func muestraLista() async  {
        //Conexión a internet
        //Pinta la lista
    }
}


class MostrarListado2 {
    
    @MainActor
    func muestraLista() async  {
        //Conexión a internet
        //Pinta la lista
    }
}


class MostrarListado3 {
    
    func muestraLista() async  {
        //Conexión a internet
        await MainActor.run {
            //Pinta la lista
        }
    }
}

