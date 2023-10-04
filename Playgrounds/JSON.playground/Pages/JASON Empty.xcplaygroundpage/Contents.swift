
import Foundation

import UIKit
//Data transfer object(Dto)
struct ProductDto: Decodable {//le indicamos que implementa el metodo Decodable
    var id: Int?
    var title: String?
    var type: String?
    var discription: String?
    var price: Double?
    var rating: Int?
    
}


//URLSession (libreria para descargar un JSON)

let url = URL(string: "https://raw.githubusercontent.com/SDOSLabs/JSON-Sample/master/Products/short_products_empty.json")!

Task {
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let json = String(data: data, encoding: .utf8) {
            print(json)
        }
        let products = try JSONDecoder().decode([ProductDto].self, from: data)
        
        print(products.count)//le pedimos que nos indique el numero de productos de dentro del array
        products.compactMap {
            $0.rating != nil ? $0 : nil
        }//devolver nulo cuando haya un valor nulo y no lo muestre en el array
        products.forEach {
            print("\($0.title ?? "") - \($0.price ?? 0)€")
        }
    } catch {
        print(error)
    }
}

