import UIKit
import Foundation

let array = [1, 2, 3, 4]

for item in array {
    print(item)
}

let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv")!

Task {
    for try await line in url.lines {
        print(line)
    }
}

