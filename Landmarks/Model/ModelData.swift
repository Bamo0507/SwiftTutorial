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
    
    // Asi es como se declara un diccionario, se declara
    // KEY, VALUE
    // Recibo un string, devuelvo una lista de tipo LANDMARK
    var categories: [String: [Landmark]]{
        Dictionary(
            // Agrupa la lista de `landmarks` en un diccionario
            grouping: landmarks,
            by: { $0.category.rawValue } // Usa el nombre de la categoría como clave del diccionario
        )
    }
    
    //Logramos filtrarlo todo en base a si es featured o no la landmark
    var features: [Landmark] {
           landmarks.filter { $0.isFeatured }
       }
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
