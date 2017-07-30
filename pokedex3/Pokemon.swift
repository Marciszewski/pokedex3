//
//  Pokemon.swift
//  pokedex3
//
//  Created by Macbook on 13.07.2017.
//  Copyright © 2017 Macbook. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
    
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    
    init (name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)"
    }
    
    func downloadPokemonDetail(completed: DownloadComplete){
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, Any> {
                
                if let weight = dict["weight"] as? String {
                    
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    
                    self._defense = "\(defense)"
                    
                }
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
            }
        }
        
    }
}
