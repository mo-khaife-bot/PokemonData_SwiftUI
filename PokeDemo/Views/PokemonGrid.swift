//
//  PokemonGrid.swift
//  PokeDemo
//
//  Created by mohomed Ali on 24/04/2023.
//

import SwiftUI

struct PokemonGrid: View {
    
    // A property wrapper type that instantiates an observable object.
    @StateObject var vm = PokemonDataViewModel()
    
    // Create an instance of the ObservableObject
//    let vm = PokemonDataViewModel()
    
    // for creating columns
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("PokeUI")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        // Supplies an ObservableObject to a view subhierarchy.
        .environmentObject(vm)
    }
}

struct PokemonGrid_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGrid()
        // Set the instance as an environment object in the parent view
//            .environmentObject(vm)
    }
}
