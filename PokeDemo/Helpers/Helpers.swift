//
//  Helpers.swift
//  PokeDemo
//
//  Created by mohomed Ali on 23/04/2023.
//

import Foundation

// we call the funcs below on Bundle so we can call them on any file we want
extension Bundle{
    
    // decodes Json
    func decode<T:Decodable>(file:String) -> T {

        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from  bundle.")
        }
        
        return loadData
    }
    
    // fetchs Data and decodes Json
    func fetchData<T:Decodable>(url: String, model: T.Type, completion: @escaping(T) -> (), failure:@escaping(Error) -> ()) {
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error  {
                    failure(error)
                }
                return
            }
            
            do{
                let serverData = try JSONDecoder().decode(T.self, from:data)
                    completion(serverData)
            } catch {
                failure(error)
            }
        }.resume()
    }
}
