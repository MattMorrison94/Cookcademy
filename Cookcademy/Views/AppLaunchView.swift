//
//  AppLaunchView.swift
//  Cookcademy
//
//  Created by Matt Morrison on 18/8/2024.
//

import SwiftUI

struct AppLaunchView: View {
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Cookcademy")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .padding()
                Image(systemName: "frying.pan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red, .purple, .mint]), startPoint: .top, endPoint: .bottom))
                Text("Cooking for everyone")
                    .font(.title3)
                    .bold()
                Spacer()
                
                ProgressView()
                Text("Loading, please wait...")
                    .font(.footnote)
            }
        }
    }
}

#Preview {
    AppLaunchView()
}

// create a linear gradient pan color struct

