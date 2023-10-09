import UIKit

//Secuencias asíncronas: son usadas para crear un array donde los elementos de éste se devuelven
// de forma asíncrona

struct NumberAsyncIterator: AsyncIteratorProtocol {
    var count = 0
    
    mutating func next() async throws -> Int? {
        count += 1
        guard count <= 5 else { return nil }  //aségurate de que count sea menor a 5, sino, nill
                                                // y el sistema se nos va al Task
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return Int.random(in: 0...1000)
    }
}

//Protocolo AsynSequence: nos dice que tenemos que tenemos que implementar diferentes cosas (opt + click)
struct NumberGenerator: AsyncSequence {
    typealias Element = Int
    
    func makeAsyncIterator() -> NumberAsyncIterator {
        return NumberAsyncIterator()
    }
}


Task {
    for try await number in NumberGenerator() {
        print(number)
    }
    print("Terminado")
}
