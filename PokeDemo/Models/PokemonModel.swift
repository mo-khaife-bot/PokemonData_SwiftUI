//
//  PokemonModel.swift
//  PokeDemo
//
//  Created by mohomed Ali on 23/04/2023.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
    
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name : String
    let url : String
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

// MARK: - Data for Details Page
struct DetailPokemon : Codable {
    let id : Int
    let height : Int
    let weight : Int
//    let species: Species
}

//// MARK: - Species
//struct Species: Codable {
//    let name: String
//    let url: String
//}
//
//// MARK: - TypeElement
//struct TypeElement: Codable {
//    let slot: Int
//    let type: Species
//}
