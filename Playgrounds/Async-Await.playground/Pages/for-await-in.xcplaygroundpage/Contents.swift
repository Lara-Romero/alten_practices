import UIKit
import Foundation

//Leer una frecuencia asíncrona
//Bucle for sobre un array asíncrono
let array = [1, 2, 3, 4]

for item in array {
    print(item)
}

let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv")!

Task {                                          // line -> variable
    for try await line in url.lines {          //url.lines -> función
        print(line)
    }
}

//Todo esto va leyendo línea a línea la url y conforme va leyendo cada línea, la va imprimiendo

