import Foundation

protocol ConocimientosProgramacion {
    
}

protocol Programador {
    associatedtype Conocimientos: ConocimientosProgramacion
    
    func exponerConocimientos() -> ConocimientosProgramacion
}

protocol JefeDepartamento {
    associatedtype Conocimientos
    
    //entre los corchetes tendrímaos que decir que queremos que sean Programador , pero no se puede porque el protocolo Programador
    // tiene tipo asociado por lo que:
    associatedtype Lacayos: Programador where Lacayos.Conocimientos == Conocimientos
    //como queremos que los conocimientos de los lacayos sean los mismos que los del JefeDepartamento ponemos lo anterior
    
    var lacayos: [Lacayos] { get }
}
