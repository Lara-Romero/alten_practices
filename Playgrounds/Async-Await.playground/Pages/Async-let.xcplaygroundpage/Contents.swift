import UIKit

let image1 = URL(string: "https://github.com/SDOSLabs/JSON-Sample/raw/master/Products/images/0.jpg")!
let image2 = URL(string: "https://github.com/SDOSLabs/JSON-Sample/raw/master/Products/images/1.jpg")!
let image3 = URL(string: "https://github.com/SDOSLabs/JSON-Sample/raw/master/Products/images/2.jpg")!

//Cada vez que llamamos a una imagen, le decimos al sistema que se espere hasta obtener la imagen
//una vez que tenemos esa imgen, se inicia la segunda descarga de imagen y así sucesivamente
//Por esto, este código no es muy óptimo, porque queremos que se descanguen todas las imágenes a la vez
Task {
    let (data1, _) = try await URLSession.shared.data(from: image1)
    let (data2, _) = try await URLSession.shared.data(from: image2)
    let (data3, _) = try await URLSession.shared.data(from: image3)
    
    //Transformamos los datos a imagen
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

//Hacemos uso de concurrencia -> async let
//Este código sería el que tendríamos que usar  -> descargamos todos los datos a la vez
Task {
    async let (data1, _) = try URLSession.shared.data(from: image1)
    async let (data2, _) = try URLSession.shared.data(from: image2)
    async let (data3, _) = try URLSession.shared.data(from: image3)
    
    //aquí es donde marcamos que se espere por los datos antes de hacer el código
    try await [data1, data2, data3].forEach{
        if let img = UIImage(data: $0) {
            print(img)
            img
        }
    }
}



