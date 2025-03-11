//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Bryan Martinez on 8/03/25.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {

            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets()) //Jala todo el resto de espacio que quede libre
                
//                •    modelData.categories.keys obtiene todas las claves del diccionario, que en este caso representan las categorías de los Landmark.
//                •    .sorted() ordena las claves alfabéticamente.
//                •    id: \.self le dice a SwiftUI que cada clave (key) es única y puede usarse como identificador en la lista.
//                •    { key in inicia un closure, donde key representa cada categoría dentro del ForEach.
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets()) //Agarra todo el borde, como cuando en android quitaba el padding
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
