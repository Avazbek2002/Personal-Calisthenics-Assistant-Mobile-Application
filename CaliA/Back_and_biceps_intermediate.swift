//
//  ChestWorkout.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 26/04/2024.
//

import SwiftUI

struct Back_and_Biceps_intermediate: View {
    var body: some View {
        ScrollView {
            ZStack {
                Image("back")
                    .resizable()
                .aspectRatio(contentMode: .fit)
                
                LinearGradient(gradient: Gradient(colors:
                                                    [.clear, Color(.systemBackground)]), startPoint: .top,
                               endPoint: .bottom)
                .overlay(alignment: .bottom) {
                    VStack(alignment: .leading, content: {
                        Text("Back & Biceps Burn")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Intermediate")
                        
                    })
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.horizontal)
                }
                
            }
            
            VStack(alignment: .leading, spacing:8, content: {
                Label("15 mins, Intermediate", systemImage: "timer")
                
                Label("Rings if available", systemImage: "dumbbell.fill")
                
                Text("The rest between the exercises should be about 90 seconds. Hydrate yourself between the sets. In the last set of each exercse try to go till failure. Follow 3-1-2 rule. That is, take 3 seconds to go up, 1 second in upper position and go down in 2 seconds.")
                    .padding(.top)
            })
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding()
            
            VStack (spacing: 8) {
                ListTileView(imageName: "neutral", title: "Neutral Grip Pull ups", subtitle: "2x10")
                ListTileView(imageName: "pull_up_bar", title: "Normal Pull ups", subtitle: "2x10")
                ListTileView(imageName: "chin_ups", title: "Chin ups", subtitle: "2x10")
            }
        }
//        .overlay (alignment: .bottom) {
//            HStack {
//                Button {
//
//                } label: {
//                    ZStack {
//                        Capsule()
//                            .frame(height: 50)
//
//                        Text("Start workout")
//                            .font(.title2)
//                            .fontWeight(.semibold)
//                            .foregroundStyle(.blue)
//                    }
//                }
//            }
//            .frame(height: 50)
//            .foregroundColor(Color(.tertiarySystemBackground))
//            .shadow(radius: 4)
//            .padding()
//
//        }
          .edgesIgnoringSafeArea(.top)
        
        
    }
        
}

#Preview {
    Back_and_Biceps_intermediate()
}
