//
//  PokemonManager.swift
//  PokeDemo
//
//  Created by mohomed Ali on 23/04/2023.
//

import Foundation


/**
 allowes us to retrieve data in ViewModel - helps with decoding data and returning in an example we recognise
 */

class PokemonManager {
    
//    read the initial state of the Pokemon Data
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
        
    }
    
    // get the details of the Pokemon Data
    func getDetailPokemon(id: Int, _ completion:@escaping (DetailPokemon) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) { data in
            completion(data)
            
        } failure: { error in
            print(error)
        }
    }
}
