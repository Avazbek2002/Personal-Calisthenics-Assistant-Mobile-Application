//
//  Workout.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 29/02/2024.
//

import SwiftUI

struct Workout: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: BackAndBicepsBeginner()) {
                    ListTileView(imageName: "back_muscles", title: "Back and Biceps", subtitle: "")
                }
                
                NavigationLink(destination: ChestWorkout()) {
                    ListTileView(imageName: "chest", title: "Chest and Triceps", subtitle: "")
                }
                Spacer()
            }
        }
        .navigationBarTitle("Workout")
    }
}

#Preview {
    Workout()
}
