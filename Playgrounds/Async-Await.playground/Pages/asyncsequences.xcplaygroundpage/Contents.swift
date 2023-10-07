import UIKit

struct NumberAsyncIterator: AsyncIteratorProtocol {
    var count = 0
    
    mutating func next() async throws -> Int? {
        count += 1
        guard count <= 5 else { return nil }
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return Int.random(in: 0...1000)
    }
}

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
