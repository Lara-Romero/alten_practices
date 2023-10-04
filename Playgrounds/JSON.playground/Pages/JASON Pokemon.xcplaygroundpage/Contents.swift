
import Foundation

import UIKit

//Data transfer object(Dto)
struct languajeDTO: Decodable {//le indicamos que implementa el metodo Decodable
    var english: String?
    var japanese: String?
    var chinese: String?
    var french: String?
}
struct StatsDTO: Codable {
    var hp: Int?
    var attack: Int?
    var defense: Int?
    var specialAttack: Int?
    var specialDefense: Int?
    var speed: Int?
    
    private enum CodingKeys: String, CodingKey {//los nombres son distinto asi que le indicamos para que nos iguale con los del json
        case hp: "HP"
        case attack: "Attack"
        case defense: "Defense"
        case specialAttack: "Sp. Attack"
        case specialDefense: "Sp. Defense"
        case speed: "Speed"
    }
}
struct PokemonDTO: Decodable {//le indicamos que implementa el metodo Decodable
    var id: Int?
    var name: languajeDTO?//tipo struct creada arriba ( viene entre llaves en JSON )
    var type: [String]?//tipo array ( viene entre corchetes en JSON )
    var base: StatsDTO?
    
}


//URLSession (libreria para descargar un JSON)

let url = URL(string: "https://raw.githubusercontent.com/SDOSLabs/JSON-Sample/master/Products/pokemon.json")!

Task {
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let json = String(data: data, encoding: .utf8) {
            print(json)
        }
        let pokemons = try JSONDecoder().decode([PokemonDTO].self, from: data)
        
        print(pokemons.count)//le pedimos que nos indique el numero de productos de dentro del array
        pokemons.forEach {
            var text =  """
            \($0.name?.english ?? "")
            -------------------------
            - HP: \($0.base?.hp ?? 0)
            - Attack: \($0.base?.attack ?? 0)
            - Defense: \($0.base?.defense ?? 0)
            - Sp. Attack: \($0.base?.specialAttack ?? 0)
            - Sp. Defense: \($0.base?.specialDefense ?? 0)
            - Speed: \($0.base?.speed ?? 0)
            """
        }
    } catch {
        print(error)
    }
}


