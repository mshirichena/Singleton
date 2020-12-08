//
//  ViewController.swift
//  Singleton
//
//  Created by Field Employee on 12/4/20.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        // Do any additional setup after loading the view.
//        self.parseDataJSONSerialization()
        self.parseDataCodable()
    }
//    func parseDataJSONSerialization() {
//        guard let fileURL =
//         Bundle.main.url(forResource: "PokemonExample", withExtension:   "json") else { return}
//            print(fileURL)
//          guard let fileData = try?
//         Data(contentsOf: fileURL) else {return}
//            print(fileData)
//        guard let parsedJSON = try?
//                JSONSerialization.jsonObject(with: fileData, options: []) as? [String: Any] else{return}
//        print(pokemon(json: parsedJSON))
//    }
    func parseDataCodable() {
        guard let fileURL =
         Bundle.main.url(forResource: "PokemonExample", withExtension:   "json") else { return}
            print(fileURL)
          guard let fileData = try?
         Data(contentsOf: fileURL) else {return}
            print(fileData)
        let pokemon = try? JSONDecoder().decode(CodablePokemon.self, from: fileData)
        print(pokemon)
        
    }

}

