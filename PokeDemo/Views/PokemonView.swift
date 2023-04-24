//
//  PokemonView.swift
//  PokeDemo
//
//  Created by mohomed Ali on 24/04/2023.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: PokemonDataViewModel
    
    // releveant containers
    let pokemon : Pokemon
    let dimensions : Double = 140 // dimensions of pic
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                            image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: dimensions, height: dimensions)
                            
            }
            // Loads and displays a modifiable image from the specified URL using a custom placeholder until the image loads.
            placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
                    
            }
            // A material that’s more translucent than opaque.
            .background(.thinMaterial)
            // Sets a clipping shape for this view.
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced)).padding(.bottom, 20)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView( pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonDataViewModel())
    }
}
