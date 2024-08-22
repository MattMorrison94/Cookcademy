//
//  CookcademyApp.swift
//  Cookcademy
//
//  Created by Matthew Morrison on 8/4/24.
//

import SwiftUI

@main
struct CookcademyApp: App {
    @State private var showLaunchScreen: Bool = true
    var body: some Scene {
        WindowGroup {
            if showLaunchScreen {
                AppLaunchView()
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showLaunchScreen = false
                            }
                        }
                    }
            } else {
                MainTabView()
            }
        }
    }
}
