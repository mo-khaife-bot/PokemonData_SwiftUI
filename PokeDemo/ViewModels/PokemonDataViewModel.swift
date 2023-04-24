//
//  ViewModel.swift
//  PokeDemo
//
//  Created by mohomed Ali on 23/04/2023.
//

import Foundation

import SwiftUI


// since confirms to ObservableObject protocol has @published attribute
// so any changes to this property should trigger an update to the views displaying it
final class PokemonDataViewModel: ObservableObject{
    
    @EnvironmentObject var pokemonDataViewModel: PokemonDataViewModel
    
    private let pokemonManager = PokemonManager()
    
    
    // the @Published allow us to change the data of the UI
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    
    // allowes to incorporate Search Bar
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    // ensure the pokemon.json is initialised
    init() {
        self.pokemonList = pokemonManager.getPokemon()
//        verify this qorks by printing the data
//        print(self.pokemonList)
    }
    
    // get pokeon Id and add 1 as 0 indexed
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        // initializer with dummy data
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0)
        
        pokemonManager.getDetailPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
        
    }
    
    // helper func to format height/ weight
    func formatHW(value: Int) -> String {
        let dvalue = Double(value)
        let string = String(format: "%.2f", dvalue / 10)
        
        return string
    }
    
    
    
}
