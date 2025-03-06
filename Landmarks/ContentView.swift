//
//  ContentView.swift
//  Landmarks
//
//  Created by Bryan Martinez on 6/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                // <- Swift aplica todo lo que se coloqeu a un stack a sus elementos
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Lorem ipsum loie ase jike hikesae holaers")
            }
            .padding()
            
            Spacer()
                
        }
    }
}

#Preview {
    ContentView()
}
