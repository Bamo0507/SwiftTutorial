//
//  ContentView.swift
//  Landmarks
//
//  Created by Bryan Martinez on 6/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
