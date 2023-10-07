import UIKit

func saludar() async {
    try? await Task.sleep(nanoseconds: 3_000_000_000)
    print("Hello world")
}

func saludar2() {
    Task {
        print("Hello world")
    }
}

print("Empieza")
Task {
    await saludar()
    
}
print("Termina")

Task(priority: .userInitiated) {
    await saludar()
}
