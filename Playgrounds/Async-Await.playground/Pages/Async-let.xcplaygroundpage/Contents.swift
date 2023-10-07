import UIKit

let image1 = URL(string: "https://github.com/SDOSLabs/JSON-Sample/raw/master/Products/images/0.jpg")!
let image2 = URL(string: "https://github.com/SDOSLabs/JSON-Sample/raw/master/Products/images/1.jpg")!
let image3 = URL(string: "https://github.com/SDOSLabs/JSON-Sample/raw/master/Products/images/2.jpg")!

Task {
    let (data1, _) = try await URLSession.shared.data(from: image1)
    let (data2, _) = try await URLSession.shared.data(from: image2)
    let (data3, _) = try await URLSession.shared.data(from: image3)
    
    if let img = UIImage(data: data1) {
        img
    }
    if let img = UIImage(data: data2) {
        img
    }
    if let img = UIImage(data: data3) {
        img
    }
}

Task {
    async let (data1, _) = try URLSession.shared.data(from: image1)
    async let (data2, _) = try URLSession.shared.data(from: image2)
    async let (data3, _) = try URLSession.shared.data(from: image3)
    
    try await [data1, data2, data3].forEach{
        if let img = UIImage(data: $0) {
            print(img)
            img
        }
    }
}



