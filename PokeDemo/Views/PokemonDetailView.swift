//
//  PokemonDetailView.swift
//  PokeDemo
//
//  Created by mohomed Ali on 23/04/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    // A property wrapper type for an observable object supplied by a parent or ancestor view.
//    @EnvironmentObject var vm: PokemonDataViewModel
    
    @StateObject var vm = PokemonDataViewModel()
    
    
    
    // container for the Pokemon type
    let pokemon : Pokemon
    
    var body: some View {
        VStack{
            PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10) {
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                Text("**Weight** \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                Text("**Height** \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) M")
            }
        }
        // Adds an action to perform before this view appears.
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            // Supplies an ObservableObject to a view subhierarchy.
            .environmentObject(PokemonDataViewModel())
    }
}
