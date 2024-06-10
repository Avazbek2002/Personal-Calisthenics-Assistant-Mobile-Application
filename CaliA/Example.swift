//
//  Example.swift
//  CaliA
//
//  Created by Avazbek Isroilov on 01/05/2024.
//

import SwiftUI

struct Example: View {
    var body: some View {
        ARViewContainer(modelName: "full_front_lever_1")
            .ignoresSafeArea()
    }
}

#Preview {
    Example()
}
