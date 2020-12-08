//
//  Pokemon.swift
//  Singleton
//
//  Created by Field Employee on 12/4/20.
//

import Foundation

//struct Pokemon {
//    let name: String
//    let baseExperience: Int
////    let species: String
//    //let sprite: String
////    let weight: Int
//
//
//    init?(json: [String: Any]) {
//        guard let name = json["name"] as? String, let exp = json["base.experience"] as? Int else { return nil}
////        let species = json["species"] as! String
//        //let sprite = json["sprite"] as! String
////        let weight = json["weight"] as! Int
//
//
//        self.name = name
//        self.baseExperience = exp
////        self.species = species
//        //self.sprite = sprite
//        self.weight = weight

//    }
//}

struct CodablePokemon: Decodable {
    let name: String
    let baseExperience: Int
    let abilities: [Ability]
    let species: Species
    let sprites: Sprite?
    //    let weight: Int
    
    
    
    
    enum CodingKeys: String, CodingKey  {
        case name
        case baseExperience = "base_experience"
        case abilities
        case species
        case sprites
        //        case weight
        
    }
}

struct Ability: Decodable {
    let isHidden: Bool
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case ability
    }
    
    enum AbilityCodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let abilityContainer = try container.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
        
        
        self.isHidden = try
            container.decode(Bool.self, forKey: .isHidden)
        self.name = try
            abilityContainer.decode(String.self, forKey: .name)
    }
    
    // Do any additional setup after loading the view.
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}

struct Species: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

struct Sprite: Decodable {
    let back_default: String
    let back_female: String?
    let back_shiny: String
    let back_shiny_female: String?
    let front_default: String
    let front_female: String?
    let front_shiny: String
    let front_shiny_female: String?
    
    enum CodingKeys: String, CodingKey {
        case back_default
        case back_female
        case back_shiny
        case back_shiny_female
        case front_default
        case front_female
        case front_shiny
        case front_shiny_female
        
    }
}
struct Moves: Decodable {
    let name: String
    let url: String
    let groupDetails: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
        case groupDetails
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try
            container.decode(String.self, forKey: .name)
        self.url = try
            container.decode(String.self, forKey: .url)
        self.groupDetails = try
            container.decode(String.self, forKey: .groupDetails)
        
    }
    
    struct GroupDetails: Decodable {
        let name: String
        let url: String
        let levelLearnedAt: Int
        let moveLearnMethodName: String
        let moveLearnMethodUrl: String
        let versionGroupName: String
        let versionGroupUrl: String
        
        enum groupKeys: String, CodingKey {
            case name
            case url
            case levelLearnedAt
        }
        
        enum LearnMethod: String, CodingKey {
            case moveLearnMethodName
            case moveLearnMethodUrl
        }
        
        enum versionGroup: String, CodingKey {
            case versionGroupName
            case versionGroupUrl
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: groupKeys.self)
            let LearnMethodContainer = try container.nestedContainer(keyedBy: LearnMethod.self, forKey: .levelLearnedAt)
            let versionGroupContainer = try container.nestedContainer(keyedBy: versionGroup.self, forKey: .levelLearnedAt)
            
            self.name = try
                container.decode(String.self, forKey: .name)
            self.url = try
                container.decode(String.self, forKey: .url)
            self.levelLearnedAt = try
                container.decode(Int.self, forKey: .levelLearnedAt)
            self.moveLearnMethodName = try
                LearnMethodContainer.decode(String.self, forKey: .moveLearnMethodName)
            self.moveLearnMethodUrl = try
                LearnMethodContainer.decode(String.self, forKey: .moveLearnMethodUrl)
            self.versionGroupName = try
                versionGroupContainer.decode(String.self, forKey: .versionGroupName)
            self.versionGroupUrl = try
                versionGroupContainer.decode(String.self, forKey: .versionGroupUrl)
        }
        
    }
    
}


