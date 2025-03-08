//
//  ModelData.swift
//  Landmarks
//
//  Created by Bryan Martinez on 6/03/25.
//

import Foundation

@Observable
class ModelData {
    //Se declara la informacion del JSON y el tipo de dato que se creo
    //Pareciera que esto termina siendo una variable global
    var landmarks: [Landmark] = load("landmarkData.json")
}


// Se encargara de manejar la data que vendria en un json
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
