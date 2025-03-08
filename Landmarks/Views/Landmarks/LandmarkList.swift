//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bryan Martinez on 6/03/25.
//

import SwiftUI

struct LandmarkList: View {
    //Environment es como para el local storage
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    // se tiene una lista de tipo Landmark
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }

    
    var body: some View {
        // Se le pasa la lista, y se declara el campo id que se referira al id de un landmark
        
        // <- antes, ahora, si se pone Identifiable al data class, no hay problema, solito logra hacer todo
        
        //List ya actua como un lazy column
        NavigationSplitView { // Pareciera que ya solito maneja la navegacion cuando tengamos una lista
            List {
                // Se debe colocar '$' para acceder a una STATE variable, o una de sus propiedades
                Toggle(isOn: $showFavoritesOnly) {
                                    Text("Favorites only")
                                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark) // Se marca la VIEW de DESTINATION
                    } label: {
                        LandmarkRow(landmark: landmark) // Lo que activa la NAVEGACION
                    }
                }
            }
            .animation(.default, value: filteredLandmarks) // Se da el tipo de animacion, y con que queremos que se active
            .navigationTitle("Landmarks") //Se declara siempre para la navegacion el titulo
        } detail: {
            Text("Select a Landmark") // Se deja como un texto de descripcion, o probablemente sea el texto a mostrar al seleccionar
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
