//
//  PokemonApiService.swift
//  MvvmSwiftPractice
//
//  Created by etho on 12/24/22.
//

import Foundation
class PokemonApiService : ObservableObject {
   
    @Published var pokemonList: [PokmeonModel] = []
    func fetch () {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10&offset=0")
        else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self]
            data, _,
            error in
            guard let data = data , error == nil else{
                return
            }
            
            //convert to json
            
            do {
                let  = try JSONDecoder().decode([PokemonAPIResponseModel].self, from: data)
                let _pokemonList = _courses.results;
                
                DispatchQueue.main.async {
                    self?.pokemonList = _pokemonList
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
