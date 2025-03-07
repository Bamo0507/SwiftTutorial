//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Bryan Martinez on 6/03/25.
//

import SwiftUI

struct LandmarkRow: View {
    // Se declara como una stored property
    var landmark: Landmark
    
    var body: some View {
        HStack {
            //se puede hacer esto porque en el model ya se declaro la view image
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

#Preview {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
