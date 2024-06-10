//
//  Skills.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 29/02/2024.
//

import SwiftUI

struct Skills: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: PushUps(), label: {
                    SkillsTile(imageName: "push-up", title: "Push ups", subtitle: "Beginner")
                })
                
                NavigationLink(destination: PullUps(), label: {
                    SkillsTile(imageName: "pull_ups", title: "Pull ups", subtitle: "Beginner")
                })
                NavigationLink(destination: Dips(), label: {
                    SkillsTile(imageName: "dips_1", title: "Dips", subtitle: "Beginner")
                })
                NavigationLink(destination: PullUps(), label: {
                    SkillsTile(imageName: "handstand", imageWidth: 80, title: "Handstand", subtitle: "Intermediate")
                })
                NavigationLink(destination: PullUps(), label: {
                    SkillsTile(imageName: "front_lever", imageWidth: 120, title: "Front Lever", subtitle: "Advanced")
                })
                NavigationLink(destination: PullUps(), label: {
                    SkillsTile(imageName: "back_lever", imageWidth: 140, title: "Back Lever", subtitle: "Advanced")
                })
                NavigationLink(destination: PullUps(), label: {
                    SkillsTile(imageName: "human_flag", title: "Human Flag", subtitle: "Advanced")
                })
                
                
                Spacer()
            }
                
                Spacer()
            }
            .navigationTitle("Skills")
    }
}

#Preview {
    Skills()
}
