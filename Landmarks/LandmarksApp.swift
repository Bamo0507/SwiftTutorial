//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Bryan Martinez on 6/03/25.
//

import SwiftUI


@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
