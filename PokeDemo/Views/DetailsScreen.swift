//
//  DetailsScreen.swift
//  PokeDemo
//
//  Created by mohomed Ali on 24/04/2023.
//

import SwiftUI

struct DetailsScreen: View {
    
    // need container to hold the vairables you are passing
    let email: String
    let password: String
    
    var imageURL: String = "https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png"
    
    var body: some View {
        VStack{
            
            Text("email - \(email)")
            Text("password - \(password)")
            Divider()
            
            AsyncImage(url: URL(string: imageURL))
        }
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(email: "abc@.com", password: "124sss")
    }
}
