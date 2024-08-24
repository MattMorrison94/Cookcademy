//
//  SettingsView.swift
//  Cookcademy
//
//  Created by Matt Morrison on 24/8/2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("hideOptionalDirections") private var hideOptionalDirections: Bool = false
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground

    var body: some View {
        NavigationStack {
            Form {
                ColorPicker("List Background Color", selection: $listBackgroundColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                ColorPicker("Text Color", selection: $listTextColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                Toggle("Hide Optional Steps", isOn: $hideOptionalDirections)
                    .padding()
                    .listRowBackground(listBackgroundColor)
            }
            .foregroundStyle(listTextColor)
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
